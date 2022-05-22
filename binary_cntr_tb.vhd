library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
entity binary_cntr_tb is
end binary_cntr_tb;

architecture tb of binary_cntr_tb is
signal clk_tb, cnten1_tb, cnten2_tb, clr_bar_tb, rst_bar_tb,  max_cnt_tb : std_logic;
signal q_tb : std_logic_vector(2 downto 0);		
constant period : time := 50ns;
begin
	uut: entity binary_cntr port map (clk => clk_tb, cnten1 => cnten1_tb, cnten2 => cnten2_tb, up => '1', clr_bar => clr_bar_tb, rst_bar => rst_bar_tb, q => q_tb, max_cnt => max_cnt_tb);
	stimulus: process
	begin
		clk_tb <= '0';
		rst_bar_tb <= '0';
		cnten1_tb<= '0';
		cnten2_tb <= '0';
		clr_bar_tb <= '1';
		wait for period/2; 
		clk_tb <= '1';
		wait for period/2;
		
		rst_bar_tb <= '1';
		cnten1_tb <= '1';
		cnten2_tb <= '1';
		for i in 0 to 7 loop
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop; 
		
		clr_bar_tb <= '0';
		wait for period/2;
		clr_bar_tb <= '1';
		wait for period/2;
		
		cnten1_tb <= '0';
		cnten2_tb <= '1';
		for i in 0 to 7 loop
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;  
		
		cnten1_tb <= '1';
		cnten2_tb <= '0';
		for i in 0 to 7 loop
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;	
		
		cnten1_tb <= '0';
		cnten2_tb <= '0';
		for i in 0 to 7 loop
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		
		cnten1_tb <= '1';
		cnten2_tb <= '1';
		for i in 0 to 3 loop
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		clr_bar_tb <= '0';
		clk_tb <= '0';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		clk_tb <= '0';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		clk_tb <= '0';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		
	wait;
	end process;	
	
end tb;