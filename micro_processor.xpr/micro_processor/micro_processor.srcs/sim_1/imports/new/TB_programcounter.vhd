----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2024 12:13:15 AM
-- Design Name: 
-- Module Name: TB_programcounter - Behavioral
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

entity TB_programcounter is
--  Port ( );
end TB_programcounter;

architecture Behavioral of TB_programcounter is
component Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in std_logic;
           M_in : in STD_LOGIC_VECTOR (2 downto 0);
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;
COMPONENT Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;

signal Reset:std_logic;
signal M_in,M_Sel :  STD_LOGIC_VECTOR (2 downto 0);
SIGNAL  Clk_in,Clk_out: STD_LOGIC;
begin

UUT:Program_Counter port map(Reset,Clk_out,M_in,M_Sel);
UUT1:Slow_Clk PORT MAP(Clk_in,Clk_out);
PROCESS BEGIN
Clk_in<='1';
wait for 3 ns;
Clk_in<='0';
wait for 3 ns;
end process;
process begin
Reset<='1';
M_in<="111";
wait for 100 ns;
Reset<='0';
wait for 100 ns;
M_in<="110";
wait for 100 ns;
M_in<="101";
wait for 100 ns;
M_in<="100";
wait for 100 ns;
M_in<="011";
wait for 100 ns;
M_in<="010";
wait for 100 ns;
M_in<="001";
wait for 100 ns;
M_in<="000";
wait for 100 ns;


end process;
end Behavioral;
