library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


use IEEE.STD_LOGIC_SIGNED.ALL; 
-- Porque el procesador trabaja con operaciones con signo, si elijo unsigned tendria operaciones incongruentes

entity ALU_pI is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC
           );
end ALU_pI;

architecture Behavioral of ALU_pI is
    SIGNAL val : STD_LOGIC_VECTOR (31 downto 0);
begin

    process(a,b,control,val)
    begin
        if (control = "000") then
            val <= (a and b);
        elsif (control = "001") then
            val <= (a or b);
        elsif (control = "010") then
            val <= (a + b);
        elsif (control = "110") then
            val <= (a - b);
        elsif (control = "100") then
            val <= b(15 downto 0) & x"0000";
        elsif (control = "111") then
            if (a < b) then
                val <= x"00000001";
            else
                val <= x"00000000"; 
            end if;   
        else
            result <= x"00000000";
        end if;
        
        -- Zero -- El when solo es soportado en VHDL 1076-2008
        if (val = x"00000000") then
            zero <= '1';
        else
            zero <= '0';
        end if;
        
        result <= val;
    end process;
    
end Behavioral;