----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2017 14:04:23
-- Design Name: 
-- Module Name: P1b_TB - Behavioral
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

entity P1b_TB is
--  Port ( );
end P1b_TB;

architecture Behavioral of P1b_TB is

    -- Las señales siempre deben estar antes del begin
component Mux21 is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (31 downto 0));
end component;

    -- Imputs
    signal a : STD_LOGIC_VECTOR (31 downto 0);
    signal b : STD_LOGIC_VECTOR (31 downto 0);
    signal sel : STD_LOGIC;
    
    -- Outputs
    signal o : STD_LOGIC_VECTOR (31 downto 0);

begin

    uut: Mux21 PORT MAP(
		a => a,
		b => b,
		sel => sel,
		o => o
	);
    
    tb_prc: process
    begin
        a <= x"12345678";
        b <= x"87654321";
        sel <= '0';
        --wait for 100 ns; -- Es necesario para que cargue los valores en a, b y sel
        
        assert o = b report "NO ANDA!" severity ERROR;        
        sel <= '1';
        wait for 100 ns;
        
        assert o = a report "NO ANDA!" severity ERROR;
        wait;
    end process;
        
end Behavioral;
