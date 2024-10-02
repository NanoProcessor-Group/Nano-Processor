----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 09:48:48 PM
-- Design Name: 
-- Module Name: TB_MUX - Behavioral
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

entity TB_MUX is
--  Port ( );
end TB_MUX;

architecture Behavioral of TB_MUX is
component Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D0,D1,D2,D3,D4,D5,D6,D7 : in std_logic_vector (3 downto 0);
           
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_vector(3 downto 0));
end component;
signal s:STD_LOGIC_VECTOR (2 downto 0);
signal D0,D1,D2,D3,D4,D5,D6,D7,Y:STD_LOGIC_VECTOR (3 downto 0);
signal EN:STD_LOGIC;
begin
UUT:Mux_8_to_1 port map(s,D0,D1,D2,D3,D4,D5,D6,D7,EN,Y);
process begin
EN<='1';
s<="000";
D0<="0001";
D1<="0010";
D2<="0011";
D3<="0100";
D4<="0101";
D5<="0110";
D6<="0111";
D7<="1000";
wait for 100 ns;
s<="001";
wait for 100 ns;
s<="010";
wait for 100 ns;
s<="011";
wait for 100 ns;
s<="100";
wait for 100 ns;
s<="101";
wait for 100 ns;
s<="110";
wait for 100 ns;
s<="111";
wait;



end process;

end Behavioral;
