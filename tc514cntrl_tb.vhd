library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity tc514cntrl_tb is
	
end tc514cntrl_tb;

architecture tb of tc514cntrl_tb is
signal soc_tb, rst_bar_tb, clk_tb, cmptr_tb, a_tb, b_tb, busy_bar_tb : std_logic;
signal dout_tb : std_logic_vector(15 downto 0);
constant period : time := 50ns;
begin
	uut: entity tc514cntrl port map(soc => soc_tb, rst_bar => rst_bar_tb, clk => clk_tb, cmptr => cmptr_tb, busy_bar => busy_bar_tb, a => a_tb, b => b_tb, dout => dout_tb);
	stimiulus: process
	begin
		clk_tb <= '0';
		rst_bar_tb <= '0';
		soc_tb <= '0';
		cmptr_tb <= '1';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		rst_bar_tb <= '1';
		for i in 0 to (2**16)*4 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		
		for i in 0 to 50 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		soc_tb <= '1';
		for i in 0 to (2**16)*4 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		for i in 0 to 50 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		cmptr_tb <= '0';
		for i in 0 to 50 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		cmptr_tb <= '1';
		for i in 0 to 50 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;	  	 
		for i in 0 to 50 loop
			--report "i = " & integer'image(i);
			clk_tb <= '0';
			wait for period/2;
			clk_tb <= '1';
			wait for period/2;
		end loop;
		wait;
	end process;
end tb;