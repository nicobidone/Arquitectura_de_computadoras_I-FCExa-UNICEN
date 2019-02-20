----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2017 15:29:01
-- Design Name: 
-- Module Name: P1d_TB - Behavioral
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

entity P1d_TB is
--  Port ( );
end P1d_TB;

architecture Behavioral of P1d_TB is
    Component ALU_pI
        Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
               b : in STD_LOGIC_VECTOR (31 downto 0);
               control : in STD_LOGIC_VECTOR (2 downto 0);
               result : out STD_LOGIC_VECTOR (31 downto 0);
               zero : out STD_LOGIC
               );
    end Component;
    
    SIGNAL a : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL b : STD_LOGIC_VECTOR (31 downto 0) := (others=>'0');
    SIGNAL control : STD_LOGIC_VECTOR (2 downto 0) := (others=>'0');
    
    SIGNAL result : STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL zero : STD_LOGIC;
    
    constant clk_period: time := 100 ns;
    
begin

    uut : ALU_pI Port Map(        
           a => a,
           b => b,
           control => control,
           result => result,
           zero => zero
    );
    
    a <= x"00001234";
    b <= x"56780000";
    
    opciones : process
    begin
        --Prueba AND 
        control <= "000";
        wait for clk_period;
        
        --Prueba OR
        control <= "001";
        wait for clk_period;
        
        --Prueba ADD
        control <= "010";
        wait for clk_period;
        
        --Prueba SUB
        control <= "110";
        wait for clk_period;
        
        --Prueba MENOR
        control <= "111";       
        wait for clk_period;
        
        --Prueba DESPLAZAMIENTO
        control <= "100";
        wait for clk_period;
        
        --Prueba OTHERS
        control <= "101";
        wait for clk_period;
    end process;    

end Behavioral;
