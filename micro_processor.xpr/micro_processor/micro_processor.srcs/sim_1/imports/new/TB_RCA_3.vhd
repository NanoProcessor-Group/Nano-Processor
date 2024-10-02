----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2024 12:03:18 AM
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is
component RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;
signal A,S:STD_LOGIC_VECTOR (2 downto 0);
signal C_out:std_logic;
begin
UUT:RCA_3 port map(A,S,C_out);
process begin
A<="000";
wait for 100 ns;
A<="001";
wait for 100 ns;
A<="010";
wait for 100 ns;
A<="011";
wait for 100 ns;
A<="100";
wait for 100 ns;
A<="101";
wait for 100 ns;
A<="110";
wait for 100 ns;
A<="111";
wait for 100 ns;
A<="010";
wait for 100 ns;
end process;

end Behavioral;
