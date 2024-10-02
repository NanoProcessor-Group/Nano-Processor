----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 09:29:15 PM
-- Design Name: 
-- Module Name: TB_slowclock - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_slowclock is
--  Port ( );
end TB_slowclock;

architecture Behavioral of TB_slowclock is
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal   Clk_in : STD_LOGIC;
signal   Clk_out : STD_LOGIC;
begin
UUT:SLow_Clk port map(Clk_in,Clk_out);
process begin
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
Clk_in<='1';
wait for 5 ns;
Clk_in<='0';
wait for 5 ns;
end process;
end Behavioral;
