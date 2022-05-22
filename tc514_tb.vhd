library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity tc514_tb is
	
end tc514_tb;

architecture tb of tc514_tb is
	signal soc_tb, rst_bar_tb, clk_tb, cmptr_tb, a_tb, b_tb, busy_bar_tb : std_logic;
	signal dout_tb, analog_tb : std_logic_vector(15 downto 0);
	constant period : time := 50ns;
begin
	u0: entity tc514cntrl port map(soc => soc_tb, rst_bar => rst_bar_tb, clk => clk_tb, cmptr => cmptr_tb, busy_bar => busy_bar_tb, a => a_tb, b => b_tb, dout => dout_tb);
	u1:	entity tc514model port map(a => a_tb, b => b_tb, clk => clk_tb, cmptr => cmptr_tb, rst_bar => rst_bar_tb, analog_val_bin => analog_tb);	
	
	stimulus: process
	begin
		--inputs are soc, rst_bar, clk, analog_val_bin
		-- output is dout
		analog_tb <= "0000000000001111";
		clk_tb <= '0';
		rst_bar_tb <= '0';
		soc_tb <= '0';
		--cmptr_tb <= '1';
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		rst_bar_tb <= '1';
		for j in 0 to 500 loop
			analog_tb <= std_logic_vector(to_unsigned(j, 16));
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
			for i in 0 to 100 loop
				--report "i = " & integer'image(i);
				clk_tb <= '0';
				wait for period/2;
				clk_tb <= '1';
				wait for period/2;
			end loop;
			assert (dout_tb = analog_tb)
			report "test failed for j = " & integer'image(j);
			for i in 0 to 100 loop
				--report "i = " & integer'image(i);
				clk_tb <= '0';
				wait for period/2;
				clk_tb <= '1';
				wait for period/2;
			end loop;
		end loop;
		wait;
	end process;
end tb;
