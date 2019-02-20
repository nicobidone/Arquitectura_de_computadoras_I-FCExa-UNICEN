----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.05.2017 14:30:35
-- Design Name: 
-- Module Name: P1e - Behavioral
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
--use IEEE.STD_LOGIC_SIGNED.ALL;  -- Las direcciones del registro no pueden ser negativas
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Registers is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           wr : in STD_LOGIC;
           reg1_rd : in STD_LOGIC_VECTOR (4 downto 0);
           reg2_rd : in STD_LOGIC_VECTOR (4 downto 0);
           reg_wr : in STD_LOGIC_VECTOR (4 downto 0);
           data_wr : in STD_LOGIC_VECTOR (31 downto 0);
           data1_rd : out STD_LOGIC_VECTOR (31 downto 0);
           data2_rd : out STD_LOGIC_VECTOR (31 downto 0));
end Registers;

architecture Behavioral of Registers is
    type tmem is array (31 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
    SIGNAL  Regs:tmem;
    
begin
        
    process (clk,reset,wr)
    begin
        if (reset = '1') then
            for i in 0 to 31 loop
                Regs(i) <= (others => '0');
            end loop;
        elsif (FALLING_EDGE(clk) and (wr = '1')) then
            Regs(CONV_INTEGER(reg_wr)) <= data_wr;
        end if;    
    end process;
    
    data1_rd <= (others => '0') when reg1_rd = "00000" else Regs(CONV_INTEGER(reg1_rd));
    data2_rd <= (others => '0') when reg2_rd = "00000" else Regs(CONV_INTEGER(reg2_rd));    
    
end Behavioral;
