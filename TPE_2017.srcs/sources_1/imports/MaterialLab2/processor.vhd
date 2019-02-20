library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity processor is
port(
	Clk         : in  std_logic;
	Reset       : in  std_logic;
	-- Instruction memory
	I_Addr      : out std_logic_vector(31 downto 0);
	I_RdStb     : out std_logic;
	I_WrStb     : out std_logic;
	I_DataOut   : out std_logic_vector(31 downto 0);
	I_DataIn    : in  std_logic_vector(31 downto 0);
	-- Data memory
	D_Addr      : out std_logic_vector(31 downto 0);
	D_RdStb     : out std_logic;
	D_WrStb     : out std_logic;
	D_DataOut   : out std_logic_vector(31 downto 0);
	D_DataIn    : in  std_logic_vector(31 downto 0)
);
end processor;


architecture processor_arq of processor is   
     
    -- IF
    SIGNAL IF_PCNext: std_logic_vector(31 downto 0);
    SIGNAL IF_PCPlus4: std_logic_vector(31 downto 0);
    SIGNAL IF_PCOut : std_logic_vector(31 downto 0);
    SIGNAL IF_DataIn : std_logic_vector(31 downto 0);
    
        -- Salidas
        SIGNAL ID_PCPlus4: std_logic_vector(31 downto 0);
        SIGNAL ID_DataIn: std_logic_vector(31 downto 0);
        
    -- ID
    component Registers 
        Port ( 
            clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            wr : in STD_LOGIC;
            reg1_rd : in STD_LOGIC_VECTOR (4 downto 0);
            reg2_rd : in STD_LOGIC_VECTOR (4 downto 0);
            reg_wr : in STD_LOGIC_VECTOR (4 downto 0);
            data_wr : in STD_LOGIC_VECTOR (31 downto 0);
            data1_rd : out STD_LOGIC_VECTOR (31 downto 0);
            data2_rd : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;
    SIGNAL WB_RegWrite : STD_LOGIC; 
    SIGNAL WB_Inst : STD_LOGIC_VECTOR (4 downto 0);
    SIGNAL ID_data1_rd : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL ID_data2_rd : STD_LOGIC_VECTOR (31 downto 0);
    --
    SIGNAL ID_rs: std_logic_vector(4 downto 0);
    SIGNAL ID_rt: std_logic_vector(4 downto 0);
    SIGNAL ID_rd: std_logic_vector(4 downto 0);
    SIGNAL ID_inm: std_logic_vector(15 downto 0);
    
    SIGNAL ID_SignExtend: std_logic_vector(31 downto 0);
    SIGNAL ID_CtrlEX: std_logic_vector(3 downto 0);
    SIGNAL ID_CtrlMEM: std_logic_vector(2 downto 0);
    SIGNAL ID_CtrlWB: std_logic_vector(1 downto 0);
    SIGNAL ID_JumpReg: std_logic;                           -- JR
    SIGNAL ID_instrIndex: std_logic_vector(25 downto 0);    -- JAL
    SIGNAL ID_RegDestJAL: std_logic;                        -- JAL
    
        -- Salidas
        SIGNAL EX_PCPlus4: std_logic_vector(31 downto 0);
        SIGNAL EX_JumpReg : std_logic;                              -- JR
        SIGNAL EX_instrIndex: std_logic_vector(25 downto 0);        -- JAL
        SIGNAL EX_RegDestJAL: std_logic;                            -- JAL
        SIGNAL EX_rt: std_logic_vector(4 downto 0);
        SIGNAL EX_rd: std_logic_vector(4 downto 0);
        SIGNAL EX_SignExtend: std_logic_vector(31 downto 0);
        SIGNAL EX_CtrlEX: std_logic_vector(3 downto 0);
        SIGNAL EX_CtrlMEM: std_logic_vector(2 downto 0);
        SIGNAL EX_CtrlWB: std_logic_vector(1 downto 0);
        SIGNAL EX_data1_rd: std_logic_vector(31 downto 0);
        SIGNAL EX_data2_rd: std_logic_vector(31 downto 0);
    
    -- EX
    component ALU is
       Port ( 
           a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC
       );
    end component;
    --
    SIGNAL EX_ShLeft : std_logic_vector(31 downto 0);
    SIGNAL EX_reg : std_logic_vector(31 downto 0);
    SIGNAL EX_ALUSrc : std_logic;
    SIGNAL EX_RegDest : std_logic;
    SIGNAL EX_ALUOp : std_logic_vector (1 downto 0);
    SIGNAL EX_AddOut: std_logic_vector (31 downto 0);    
    SIGNAL EX_ALUZero : std_logic;
    SIGNAL EX_ALUOut: std_logic_vector (31 downto 0);
    SIGNAL EX_ALUCtrlOut: std_logic_vector(2 downto 0);
    SIGNAL EX_inst : std_logic_vector(4 downto 0);
    SIGNAL EX_instM : std_logic_vector(4 downto 0);         -- JAL
    SIGNAL EX_PCJAL : std_logic_vector (31 downto 0);       -- JAL
    SIGNAL EX_PCPlus8: std_logic_vector (31 downto 0);      -- JAL
    
        -- Salidas
        SIGNAL MEM_AddOut : std_logic_vector(31 downto 0);
        SIGNAL MEM_AddOutM : std_logic_vector(31 downto 0);     -- JR
        SIGNAL MEM_PCJAL : std_logic_vector (31 downto 0);      -- JAL
        SIGNAL MEM_AddOutMJAL : std_logic_vector(31 downto 0);  -- JAL
        SIGNAL MEM_RegDestJAL: std_logic;                       -- JAL
        SIGNAL MEM_PCPlus8: std_logic_vector (31 downto 0);     -- JAL
        SIGNAL MEM_ALUZero : std_logic;
        SIGNAL MEM_ALUOut : std_logic_vector(31 downto 0);
        SIGNAL MEM_data2_rd : std_logic_vector(31 downto 0);
        SIGNAL MEM_Inst : std_logic_vector(4 downto 0);    
        SIGNAL MEM_CtrlMEM: std_logic_vector(2 downto 0);
        SIGNAL MEM_CtrlWB: std_logic_vector(1 downto 0);
        SIGNAL MEM_JumpReg : std_logic;                         -- JR    
    
    -- MEM
    SIGNAL MEM_Read : std_logic;
    SIGNAL MEM_Write : std_logic;
    SIGNAL MEM_Jump : std_logic;
    SIGNAL MEM_BranchOut : std_logic ;
    SIGNAL MEM_BranchOutOR : std_logic ;                 -- JR
    SIGNAL MEM_DataIn : std_logic_vector(31 downto 0);
        
        -- Salidas
        SIGNAL WB_CtrlWB : std_logic_vector(1 downto 0);
        SIGNAL WB_ALUOut : std_logic_vector(31 downto 0);
        SIGNAL WB_RegDestJAL: std_logic;                        -- JAL
        SIGNAL WB_PCPlus8: std_logic_vector (31 downto 0);      -- JAL
        
    -- WB    
    SIGNAL WB_MemToReg: std_logic;
    SIGNAL WB_DataIn: std_logic_vector (31 downto 0);
    SIGNAL WB_MuxOut : std_logic_vector(31 downto 0);
    SIGNAL WB_MuxOutM : std_logic_vector(31 downto 0);          -- JAL
    
begin
 	
-- Instruction Fetching    
    -- PC+4--
    IF_PCPlus4 <= (IF_PCOut + x"00000004");
    
    -- MUX --
    IF_PCNext <= IF_PCPlus4 when (MEM_BranchOutOR = '0') else MEM_AddOutM;    -- JR & JAL
        
    -- PC --
    process (Clk,Reset)
    begin
        if (Reset = '1') then
            IF_PCOut <= (others => '0');
        elsif (rising_edge(Clk)) then
            IF_PCOut <= IF_PCNext;
        end if;    
    end process;
    
    -- Memoria de instrucciones --
    I_Addr <= IF_PCOut;
    I_RdStb <= '1';
    I_WrStb <= '0';
    I_DataOut <= (others => '0');
    IF_DataIn <= I_DataIn;
    
    -- IF/ID
    process (Reset, Clk)
    begin
        if (Reset = '1') then
            ID_PCPlus4 <= (others => '0');
            ID_DataIn <= (others => '0');                          
        elsif (RISING_EDGE(Clk)) then
            ID_PCPlus4 <= IF_PCPlus4;
            ID_DataIn <= IF_DataIn;
        end if;
    end process;    
    
-- Instruction Decode    
    -- Cables de la instruccion --
    ID_rs <= ID_DataIn(25 downto 21);
    ID_rt <= ID_DataIn(20 downto 16);
    ID_rd <= ID_DataIn(15 downto 11);
    ID_inm <= ID_DataIn(15 downto 0);
    ID_instrIndex <= ID_DataIn(25 downto 0);
    
    -- Unidad de control
    Ctrl_Unit : process(ID_DataIn)
    begin
        case (ID_DataIn(31 downto 26)) is
            when "000000" =>    --Tipo-R
                ID_CtrlEX <= "1010";
                ID_CtrlMEM <= "000";
                ID_CtrlWB <= "01";
                if (ID_DataIn(5 downto 0) = "001000") then      -- JR
                    ID_JumpReg <= '1';                          -- JR
                else                                            -- JR
                    ID_JumpReg <= '0';                          -- JR
                end if;                                         -- JR
                ID_RegDestJAL <= '0';       -- JAL
            when "100011" =>    --LOAD
                ID_CtrlEX <= "0100";
                ID_CtrlMEM <= "100";
                ID_CtrlWB <= "11";
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '0';       -- JAL
            when "101011" =>    --SAVE
                ID_CtrlEX <= "0100";
                ID_CtrlMEM <= "010";
                ID_CtrlWB <= "00";
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '0';       -- JAL
            when "000100" =>    --BEQ   
                ID_CtrlEX <= "0001";
                ID_CtrlMEM <= "001";
                ID_CtrlWB <= "00";
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '0';       -- JAL
            when "001111" =>    --LUI    
                ID_CtrlEX <= "0011";
                ID_CtrlMEM <= "000";
                ID_CtrlWB <= "00";                
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '0';       -- JAL
            when "000011" =>    --JAL    
                ID_CtrlEX <= "0000";
                ID_CtrlMEM <= "001";
                ID_CtrlWB <= "01";
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '1';       -- JAL
            when others =>    
                ID_CtrlEX <= "0000";
                ID_CtrlMEM <= "000";
                ID_CtrlWB <= "00";
                ID_JumpReg <= '0';          -- JR
                ID_RegDestJAL <= '0';       -- JAL
         end case;         
    end process;    
    
    -- Registros --    
    ID_Registers : Registers port map(
        clk => Clk,
        reset => Reset,
        wr => WB_RegWrite,
        reg1_rd => ID_rs,
        reg2_rd => ID_rt,
        reg_wr => WB_Inst,
        data_wr => WB_MuxOutM,
        data1_rd => ID_data1_rd,
        data2_rd => ID_data2_rd  
    );
    
    -- Extension de signo --
    ID_SignExtend <= (x"0000" & Id_inm) when (Id_inm(15) = '0') else (x"ffff" & ID_inm);
    
    -- ID/EX
    process (Reset, Clk)
    begin
        if (Reset = '1') then        
            EX_CtrlWB <= (others => '0');
            EX_CtrlMEM <= (others => '0');
            EX_CtrlEX <= (others => '0');
            EX_PCPlus4 <= (others => '0');
            EX_data1_rd <= (others => '0');
            EX_data2_rd <= (others => '0');
            EX_SignExtend <= (others => '0');
            EX_instrIndex <= (others => '0');       -- JAL
            EX_RegDestJAL <= '0';                   -- JAL
            EX_rt <= (others => '0');
            EX_rd <= (others => '0');
            EX_JumpReg <= '0';                       -- JR             
        elsif (RISING_EDGE(Clk)) then
            EX_CtrlWB <= ID_CtrlWB;
            EX_CtrlMEM <= ID_CtrlMEM;
            EX_CtrlEX <= ID_CtrlEX;
            EX_PCPlus4 <= ID_PCPlus4;
            EX_data1_rd <= ID_data1_rd;
            EX_data2_rd <= ID_data2_rd;
            EX_SignExtend <= ID_SignExtend;
            EX_instrIndex <= ID_instrIndex;         -- JAL
            EX_RegDestJAL <= ID_RegDestJAL;         -- JAL
            EX_rt <= ID_rt;
            EX_rd <= ID_rd;
            EX_JumpReg <= ID_JumpReg;               -- JR
        end if;
    end process;
    
-- Execute
    -- Ctrl EX --
    EX_RegDest <= EX_CtrlEX(3);
    EX_ALUSrc <= EX_CtrlEX(2);
    EX_ALUOp <= EX_CtrlEX(1 downto 0);
    
    -- Shift Left --
    EX_ShLeft <= (EX_SignExtend(29 downto 0) & "00");
    
    -- Direccion --
    EX_AddOut <= (EX_SignExtend + EX_PCPlus4);
    
    -- MUX ALU --
    EX_Reg <= EX_data2_rd when (EX_ALUSrc = '0') else EX_SignExtend;
    
    -- ALU --
    EX_ALU : ALU -- component inst --
    port map (
       a => EX_data1_rd,
       b => EX_Reg,
       control => EX_ALUCtrlOut,
       result => EX_ALUOut,
       zero => EX_ALUZero
    ); 
    
    --ALU Ctrl
    process(EX_ALUOp,EX_SignExtend)
    begin
        case (EX_ALUOp) is
            when "01" =>    -- BEQ --
                EX_ALUCtrlOut <= "110";
            when "11" =>    -- LUI --
                EX_ALUCtrlOut <= "100";
            when "10" =>
                case (EX_SignExtend(5 downto 0)) is
                    when "100000" =>    -- ADD --
                        EX_ALUCtrlOut <= "010";
                    when "100010" =>    -- SUB --
                        EX_ALUCtrlOut <= "110"; 
                    when "100100" =>    -- AND --
                        EX_ALUCtrlOut <= "000"; 
                    when "100101" =>    -- OR --
                        EX_ALUCtrlOut <= "001";     
                    when "101010" =>    -- SLT --
                        EX_ALUCtrlOut <= "111"; 
                    when "001000" =>    -- JR --
                        EX_ALUCtrlOut <= "011";             --JR
                    when others =>
                        EX_ALUCtrlOut <= "101"; -- No hace nada
                end case;
            when "00" =>
                EX_ALUCtrlOut <= "010";
            when others =>
                EX_ALUCtrlOut <= "101"; -- 101 no hace nada
        end case;
    end process;    
    
    -- MUX Registros --
    EX_InstM <= EX_rt when (EX_RegDest = '0') else EX_rd;
    
    -- JAL --
    EX_PCJAL <= (EX_PCPlus4(31 downto 28) & EX_instrIndex & "00");
    EX_PCPlus8 <= (EX_PCPlus4 + x"00000004");
    --EX_PCPlus8 <= (EX_PCPlus4 + x"00000000");
    EX_Inst <= EX_instM when (EX_RegDestJAL = '0') else b"11111";         
    
    -- ID/EX
    process (Reset, Clk)
    begin
        if (Reset = '1') then        
            MEM_CtrlWB <= (others => '0');
            MEM_CtrlMEM <= (others => '0');  
            MEM_AddOut <= (others => '0');
            MEM_ALUZero <= '0';             
            MEM_ALUOut <= (others => '0');
            MEM_data2_rd <= (others => '0');
            MEM_Inst <= (others => '0');
            MEM_JumpReg <= '0';                 -- JR 
            MEM_PCPlus8 <= (others => '0');     -- JAL
            MEM_RegDestJAL <= '0';              -- JAL
            MEM_PCJAL <= (others => '0');       -- JAL              
        elsif (RISING_EDGE(Clk)) then
            MEM_CtrlWB <= EX_CtrlWB;
            MEM_CtrlMEM <= EX_CtrlMEM;  
            MEM_AddOut <= EX_AddOut;
            MEM_ALUZero <= EX_ALUZero;             
            MEM_ALUOut <= EX_ALUOut;
            MEM_data2_rd <= EX_data2_rd;
            MEM_Inst <= EX_Inst;
            MEM_JumpReg <= EX_JumpReg;          -- JR 
            MEM_PCPlus8 <= EX_PCPlus8;          -- JAL
            MEM_RegDestJAL <= EX_RegDestJAL;    -- JAL
            MEM_PCJAL <= EX_PCJAL;              -- JAL
        end if;
    end process;
    
-- Memory
    -- Ctrl MEM --
    MEM_Read <= MEM_CtrlMEM(2);
    MEM_Write <= MEM_CtrlMEM(1);
    MEM_Jump <= MEM_CtrlMEM(0);
    
    -- JAL --
    MEM_AddOutMJAL <= MEM_AddOut when (MEM_RegDestJAL = '0') else MEM_PCJAL;
    
    -- JR --
    MEM_AddOutM <= MEM_AddOutMJAL when (MEM_JumpReg = '0') else MEM_ALUOut;
    MEM_BranchOutOR <= (MEM_BranchOut OR MEM_JumpReg);
    
    -- Branch --
    MEM_BranchOut <= (MEM_Jump AND MEM_ALUZero);
    
    -- Memoria de datos --
    D_Addr <= MEM_ALUOut;
    D_RdStb <= MEM_Read;
    D_WrStb <= MEM_Write;
    D_DataOut <= MEM_data2_rd;
    MEM_DataIn <= D_DataIn;
    
    -- MEM/WB
    process (Reset, Clk)
    begin
        if (Reset = '1') then                  
            WB_CtrlWB <= (others => '0');
            WB_DataIn <= (others => '0');
            WB_ALUOut <= (others => '0');
            WB_Inst <= (others => '0');         -- JAL
            WB_PCPlus8 <= (others => '0');      -- JAL
            WB_RegDestJAL <= '0';                   
        elsif (RISING_EDGE(Clk)) then
            WB_CtrlWB <= MEM_CtrlWB;
            WB_DataIn <= MEM_DataIn;
            WB_ALUOut <= MEM_ALUOut;
            WB_Inst <= MEM_Inst;
            WB_PCPlus8 <= MEM_PCPlus8;          -- JAL
            WB_RegDestJAL <= MEM_RegDestJAL;    -- JAL   
        end if;
    end process;
    
-- Write Back
    -- Ctrl WB --
    WB_MemToReg <= WB_CtrlWB(1);
    WB_RegWrite <= WB_CtrlWB(0);
    
    -- MUX --
    WB_MuxOut <= WB_ALUOut when (WB_MemToReg = '0') else WB_DataIn;
    
    -- JAL --
    WB_MuxOutM <= WB_MuxOut when (WB_RegDestJAL = '0') else WB_PCPlus8; 
    
end processor_arq;