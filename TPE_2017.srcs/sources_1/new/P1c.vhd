----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2017 14:06:22
-- Design Name: 
-- Module Name: P1c - Behavioral
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

entity shift is

    Port ( 
        d : in STD_LOGIC_VECTOR (31 downto 0);
        dir : in STD_LOGIC;
        load : in STD_LOGIC;
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        q : out STD_LOGIC_VECTOR (31 downto 0));
end shift;

architecture Behavioral of shift is

    signal reg: std_logic_vector(31 downto 0); 

begin
    process (clk)
        begin
        if (clk'EVENT AND clk='1') then
            if (reset = '1') then
                reg <= (others => '0');
            elsif (load = '1') then
                reg <= d;
            elsif (dir = '0') then
                reg <= reg(30 downto 0) & '0';
            else
                reg <= '0' & reg(31 downto 1);
            end if;
        end if;
    end process;
    
    q <= reg;

end Behavioral;
