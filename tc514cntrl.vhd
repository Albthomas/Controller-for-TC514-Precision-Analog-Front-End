library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity tc514cntrl is
	port(
		cmptr, soc, rst_bar, clk : in std_logic;  
		busy_bar, a, b : out std_logic;
		dout : out std_logic_vector(15 downto 0)
		);
	attribute loc : string;
	attribute loc of soc      : signal is "P2";
	attribute loc of rst_bar  : signal is "P3";
	attribute loc of clk      : signal is "P11";
	attribute loc of cmptr    : signal is "P19";
	attribute loc of a        : signal is "P20";
	attribute loc of b        : signal is "P21";
	attribute loc of dout     : signal is "P43,P42,p41,P40,P39,P38,P37,P36,P31,P30,P29,P28,P27,P26,P25,P24";
	attribute loc of busy_bar : signal is "P18";
	
end tc514cntrl;
architecture structural of tc514cntrl is
	signal clk_dvd_top, cnten1_top, clr_cntr_bar_top, max_cnt_top, load_result_top : std_logic;	
	signal q_top : std_logic_vector(15 downto 0);
begin																									
	
	u0: entity freq_div port map(clk => clk, rst_bar => rst_bar, divisor => "0100", clk_dvd => clk_dvd_top);
	u1: entity binary_cntr port map (clk => clk, cnten1 =>cnten1_top, cnten2 => clk_dvd_top, up => '1', clr_bar => clr_cntr_bar_top, rst_bar => rst_bar, max_cnt => max_cnt_top, q => q_top);
	u2: entity TC514fsm port map (soc => soc, cmptr => cmptr, max_cnt => max_cnt_top, clk => clk, clk_dvd => clk_dvd_top, rst_bar => rst_bar, a => a, b => b, busy_bar => busy_bar, cnt_en => cnten1_top, clr_cntr_bar => clr_cntr_bar_top, load_result => load_result_top);
	u3: entity out_reg port map(clk => clk, enable => load_result_top, rst_bar => rst_bar, d => q_top, q => dout);
end structural;