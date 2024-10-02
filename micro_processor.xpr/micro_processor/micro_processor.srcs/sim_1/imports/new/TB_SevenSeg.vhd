----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 09:06:41 PM
-- Design Name: 
-- Module Name: TB_SevenSeg - Behavioral
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

entity TB_SevenSeg is
--  Port ( );
end TB_SevenSeg;

architecture Behavioral of TB_SevenSeg is
component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
signal address :  STD_LOGIC_VECTOR (3 downto 0);
signal data    :  STD_LOGIC_VECTOR (6 downto 0);
begin
UUT:LUT_16_7 port map(address,data);
process begin

address<="0000";
wait for 50 ns;
address<="0001";
wait for 50 ns;
address<="0010";
wait for 50 ns;
address<="0011";
wait for 50 ns;
address<="0100";
wait for 50 ns;
address<="0101";
wait for 50 ns;
address<="0110";
wait for 50 ns;
address<="0111";
wait for 50 ns;
address<="1000";
wait for 50 ns;
address<="1001";
wait for 50 ns;
address<="1010";
wait for 50 ns;
address<="1011";
wait for 50 ns;
address<="1100";
wait for 50 ns;
address<="1101";
wait for 50 ns;
address<="1110";
wait for 50 ns;
address<="1111";
wait for 50 ns;
address<="1110";
wait;
end process;

end Behavioral;
