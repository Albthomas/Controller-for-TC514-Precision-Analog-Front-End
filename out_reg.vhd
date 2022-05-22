library ieee;
use ieee.std_logic_1164.all;
entity out_reg is
generic (n : integer := 16);
port (
clk: in std_logic; -- system clock
enable: in std_logic; -- parallel load enable
rst_bar: in std_logic; -- synchronous reset
d: in std_logic_vector (n-1 downto 0); -- data in
q: out std_logic_vector (n-1 downto 0) -- data out
);
end out_reg;  

architecture behavioral of out_reg is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if rst_bar = '0' then
				q <= (others => '0');
			elsif enable = '1' then
				q <= d;
			end if;
		end if;
	end process;
end behavioral;