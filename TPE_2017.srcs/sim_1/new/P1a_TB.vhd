LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_arith.all;

ENTITY P1a_TB IS
END P1a_TB;

ARCHITECTURE Behavioral OF P1a_TB IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT Reg
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;
		d : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL clk :  std_logic := '0';
	SIGNAL reset :  std_logic := '0';
	SIGNAL ce :  std_logic := '0';
	SIGNAL d :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL q :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: Reg PORT MAP(
		clk => clk,
		reset => reset,
		ce => ce,
		d => d,
		q => q
	);

	tclk : process
	begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process;

	trst : process
	begin
		reset <= '0';
		wait for 110 ns;
		reset <= '1';
		wait for 100 ns;
		-- reset <= '0'; -- ver que pasa si saco esto
		wait;
	end process;

	tce : process
	begin
		ce <= '0';
		wait for 150 ns;
		ce <= '1';
		wait for 100 ns;
	end process;


	tdata : process
	begin
		
		d <= x"67663412";
		wait for 400 ns;
		
		for i in 0 to 2000 loop
			d <= CONV_STD_LOGIC_VECTOR(i,32);
			wait for 55 ns;	
		end loop;
		
		wait; -- hace que el proceso no vuelva a empezar, sino hace un loop infinito
	end process;


END Behavioral;
