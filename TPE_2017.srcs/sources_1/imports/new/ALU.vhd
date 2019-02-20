----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2017 08:21:43
-- Design Name: 
-- Module Name: ALU - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


use IEEE.STD_LOGIC_SIGNED.ALL; 
-- Porque el procesador trabaja con operaciones con signo, si elijo unsigned tendria operaciones incongruentes

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           result : out STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
    SIGNAL val : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
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
        elsif (control = "011") then    -- JR
            val <= a;
        else
            val <= x"00000000";
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
