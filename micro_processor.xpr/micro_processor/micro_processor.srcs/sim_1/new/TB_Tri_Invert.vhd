----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 09:22:36 PM
-- Design Name: 
-- Module Name: TB_Tri_Invert - Behavioral
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

entity TB_Tri_Invert is
--  Port ( );
end TB_Tri_Invert;

architecture Behavioral of TB_Tri_Invert is

component TBuffer_3_Bit_I is
    Port ( B : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A,O:STD_LOGIC_VECTOR (2 downto 0);
signal C:std_logic;
begin
UUT:TBuffer_3_Bit_I port map(A,C,O);
process begin
A<="111";
C<='1';
wait for 200 ns;
A<="101";
C<='0';
wait for 200 ns;

end process;

end Behavioral;