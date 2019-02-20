----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2017 14:32:01
-- Design Name: 
-- Module Name: P1e_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P1e_TB is
--  Port ( );
end P1e_TB;

architecture Behavioral of P1e_TB is
    Component Registers_p1
    Port(
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
    
    -- Imputs
        SIGNAL clk : STD_LOGIC := '0';
        SIGNAL reset : STD_LOGIC := '0';
        SIGNAL wr : STD_LOGIC := '0';
        SIGNAL reg1_rd : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
        SIGNAL reg2_rd : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
        SIGNAL reg_wr : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
        SIGNAL data_wr : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
        
    -- Outputs
        SIGNAL data1_rd : STD_LOGIC_VECTOR (31 downto 0);
        SIGNAL data2_rd : STD_LOGIC_VECTOR (31 downto 0);
    
begin
    uut: Registers_p1 PORT MAP(
        clk => clk,
        reset => reset,
        wr => wr,
        reg1_rd => reg1_rd,
        reg2_rd => reg2_rd,
        reg_wr => reg_wr,
        data_wr => data_wr,
        data1_rd => data1_rd,
        data2_rd => data2_rd  
    );
    
    tclk : process          -- Clk
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;
    
    treset : process        -- Reseteo el arreglo
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait;
    end process;
    
    twritenable : process   -- Ctrl de escritura
    begin        
         wr <= '1';
         wait for 200 ns;
         wr <= '0';
         wait for 200 ns;
    end process;
        
    twrite : process        -- Prueba de escritura
    begin        
        for my_int in 0 to 10 loop
            data_wr <= x"35715964";
            reg_wr <= std_logic_vector(to_unsigned(my_int, reg_wr'length));
            wait for 20 ns;
        end loop;
        
        for my_int in 31 downto 21 loop
            data_wr <= x"75846218";
            reg_wr <= std_logic_vector(to_unsigned(my_int, reg_wr'length));
            wait for 20 ns;
        end loop;
        
        wait;        
    end process;
    
    tread : process         -- Prueba de lectura
    begin
        wait for 100 ns;
        for my_int in 0 to 10 loop
            reg1_rd <= std_logic_vector(to_unsigned(my_int, reg1_rd'length));
            wait for 20 ns;
        end loop;
    end process;
    
    reg2_rd <= std_logic_vector(to_unsigned(5, reg1_rd'length));

end Behavioral;
