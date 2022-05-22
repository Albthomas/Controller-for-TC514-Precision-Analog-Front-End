library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;
use work.all;
entity freq_div_tb is
	
end freq_div_tb;

architecture tb of freq_div_tb is
	signal clk_tb, rst_bar_tb, clk_dvd_tb : std_logic;
	signal divisor_tb : std_logic_vector (3 downto 0);
	constant period : time := 50ns;
begin
	uut: entity freq_div port map(clk => clk_tb, rst_bar => rst_bar_tb, divisor => divisor_tb, clk_dvd => clk_dvd_tb);
	stimulus: process
	begin	
		clk_tb <= '0';
		rst_bar_tb <= '0';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		rst_bar_tb <= '1';
		
		for j in 0 to 15 loop
			divisor_tb <= std_logic_vector(to_unsigned(j,4));
			wait for period;
			for i in 0 to 99 loop
				clk_tb <= not clk_tb;
				wait for period/2;
			end loop;
		end loop;	
		wait;
	end process;
end tb;