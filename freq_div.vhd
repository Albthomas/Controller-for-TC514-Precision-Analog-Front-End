library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	  
entity freq_div is
	port(
	clk :in std_logic; -- clk
	rst_bar : in std_logic; --synchronous reset
	divisor : in std_logic_vector(3 downto 0); -- divisor
	clk_dvd : out std_logic); -- output
	

end freq_div;
architecture behavioral of freq_div	is
begin	  
	process (clk) is  
	variable counter : integer;  
	variable clk_int : std_logic;
	begin
		if (rising_edge(clk)) then
			if (divisor = "0000" or divisor = "0001") then
				counter := 0;
			elsif (rst_bar = '0' or clk_int = '1') then
				counter := 1; 	
			else
		   		counter := counter + 1; 
			end if;
			
			if (rst_bar = '0') then
				clk_dvd <= '0';
				clk_int := '0';
			elsif (divisor = "0000" or divisor = "0001") then
				clk_int := '0';
				clk_dvd <= '0';
			elsif (counter = to_integer(unsigned(divisor))) then
				clk_int := '1';
				clk_dvd <= clk_int;
			elsif (clk_int = '1') then	 
				clk_int := '0';	
				clk_dvd <= clk_int;
			end if;
			
		end if;
	end process; 
end behavioral;