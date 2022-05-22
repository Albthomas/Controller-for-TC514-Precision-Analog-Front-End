library ieee;
use ieee.std_logic_1164.all;

entity TC514fsm is
	port (
		soc : in std_logic; -- start conversion control input
		cmptr : in std_logic; -- TC 514 comparator status input
		max_cnt : in std_logic; -- maximum count status input
		clk : in std_logic; -- system clock
		clk_dvd : in std_logic; -- clock divided down
		rst_bar: in std_logic; -- synchronous reset
		a : out std_logic; -- conversion phase control
		b : out std_logic; -- conversion phase control
		busy_bar : out std_logic; -- active low busy status
		cnt_en : out std_logic; -- counter enable control to counter
		clr_cntr_bar : out std_logic; -- signal to clear counter
		load_result : out std_logic); -- load enable
end;
architecture behavioral of TC514fsm is
type states is (idle, az_idle, integrate, deintegrate, zero_int, clear_cntr);
signal current, next_state : states;
begin
	--process(clk)
--	variable currentOutBusy : std_logic;
--	begin
--		if rising_edge(clk) then
--			if soc = '1' and currentOutBusy	/= '0' then
--				currentOutBusy := '0';
--			elsif max_cnt = '1' then
--				currentOutBusy := '1';
--			end if;
--			busy_bar <= currentOutBusy;
--		end if;
--	end process;	
	statesSelection: process(clk, current)
	begin
		if rising_edge(clk) then
			if rst_bar = '0' then
				current <= idle;
				next_state <= az_idle;
			elsif current = idle and max_cnt = '1' then
				current <= az_idle;
				next_state <= integrate;
			elsif current = az_idle and soc = '1' then
				current <= integrate;
				next_state <= deintegrate;
			elsif current = integrate and max_cnt = '1' and clk_dvd = '1' then
				current <= deintegrate;
				next_state <= zero_int;
			elsif current = deintegrate and cmptr = '0' then
				current <= zero_int;
				next_state <= clear_cntr;
			elsif current = zero_int and cmptr = '1' then
				current <= clear_cntr;
				next_state <= idle;	
			elsif current = clear_cntr then
				current <= idle;
				next_state <= az_idle;
			end if;
		end if;	
	end process;
	outputs: process (current)
	begin  
		if current = idle then
			load_result <= '0';
			clr_cntr_bar <= '1';
			cnt_en <= '1';
			busy_bar <=	'0';
			a <= '0';
			b <= '1';		
		elsif current = az_idle then
			load_result <= '0';
			clr_cntr_bar <= '0';
			cnt_en <= '0';
			busy_bar <=	'1';
			a <= '0';
			b <= '1';
					  
		elsif current = integrate then
			load_result <= '0';
			clr_cntr_bar <= '1';
			cnt_en <= '1';
			busy_bar <=	'0';
			a <= '1';
			b <= '0';
		elsif current = deintegrate then
			load_result <= '0';
			clr_cntr_bar <= '1';
			cnt_en <= '1';
			busy_bar <=	'0';
			a <= '1';
			b <= '1';
		elsif current = zero_int then
			load_result <= '1';
			clr_cntr_bar <= '1';
			cnt_en <= '0';
			busy_bar <=	'0';
			a <= '0';
			b <= '0';
		else -- clear_cntr		   	 
			load_result <= '0';
			clr_cntr_bar <= '0';
			cnt_en <= '0';
			busy_bar <=	'0';
			a <= '0';
			b <= '1';
		end if;
	end process;
end behavioral;