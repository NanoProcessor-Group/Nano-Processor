----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2024 12:08:36 AM
-- Design Name: 
-- Module Name: TB_programrom - Behavioral
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

entity TB_programrom is
--  Port ( );
end TB_programrom;

architecture Behavioral of TB_programrom is
component Program_Rom is
    Port ( M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (13 downto 0));
end component;
signal M_Sel:std_logic_vector(2 downto 0);
signal Ins:std_logic_vector(13 downto 0);
begin
UUT:Program_Rom port map(M_Sel,Ins);
process begin
M_Sel<="000";
wait for 100 ns;
M_Sel<="001";
wait for 100 ns;
M_Sel<="010";
wait for 100 ns;
M_Sel<="011";
wait for 100 ns;
M_Sel<="100";
wait for 100 ns;
M_Sel<="101";
wait for 100 ns;
M_Sel<="110";
wait for 100 ns;
M_Sel<="111";
wait for 100 ns;
M_Sel<="001";
wait for 100 ns;
end process;
end Behavioral;
