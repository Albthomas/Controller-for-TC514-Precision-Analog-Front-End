library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;
entity out_reg_tb is
end out_reg_tb;

architecture tb of out_reg_tb is
signal clk_tb, enable_tb, rst_bar_tb : std_logic;
signal d_tb, q_tb : std_logic_vector(15 downto 0); 
constant period : time := 50ns;
begin
	uut: entity out_reg port map (clk => clk_tb, enable => enable_tb, rst_bar => rst_bar_tb, d => d_tb, q => q_tb);
	stimulus: process
	begin
		clk_tb <= '0';
		rst_bar_tb <= '0';
		enable_tb <= '0';
		d_tb <= "0000000000000000";
		wait for period/2;
		clk_tb <= '1';
		wait for period/2;
		
		rst_bar_tb <= '1';
		enable_tb <= '1';
		clk_tb <= not clk_tb;
		d_tb <= "1000000000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0100000000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0010000000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0001000000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000100000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000010000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000001000000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000100000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000010000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000001000000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000100000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000010000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000001000";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000000100";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000000010";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait for period/2;
		clk_tb <= not clk_tb;
		d_tb <= "0000000000000001";
		wait for period/2;
		clk_tb <= not clk_tb;
		wait;
		
		
	end process;
end tb;
