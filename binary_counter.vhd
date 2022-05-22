library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity binary_cntr is
	generic (n : integer := 16);
	port (clk : in std_logic; -- system clock
		cnten1 : in std_logic; -- acitve high count enable
		cnten2 : in std_logic; -- active high count enable
		up : in std_logic; -- count direction
		clr_bar : in std_logic; -- synchrounous counter clear
		rst_bar: in std_logic; -- synchronous reset
		q: out std_logic_vector (n-1 downto 0);-- count
		max_cnt: out std_logic);-- maximum count indication
end binary_cntr;

architecture arc1 of binary_cntr is
	
begin
	process (clk) is
		variable memory : std_logic_vector(n-1 downto 0);
	begin
		if rising_edge(clk) then	   
			if ((rst_bar = '0' or clr_bar = '0')) then
				memory := std_logic_vector(to_unsigned(0, n));
			elsif (cnten1 = '1' and cnten2 = '1') then
				memory := std_logic_vector(to_unsigned(to_integer(unsigned(memory)) + 1, n));
				--if up = '1' then
				--memory := std_logic_vector(to_unsigned(to_integer(unsigned(memory)) + 1, n));	
				--else
				--memory := std_logic_vector(to_unsigned(to_integer(unsigned(memory)) - 1, n));	 
				--end if;
			end if;	   
			--if to_integer(unsigned(memory)) = 2**16 - 1 then --2**3 - 1 then --2**16 - 1 then
				--max_cnt <= '1';
			--else 
				--max_cnt <= '0';
			--end if;
			max_cnt <= and memory;
			q <= memory;
		end if;
	end process;
	
	
end arc1;