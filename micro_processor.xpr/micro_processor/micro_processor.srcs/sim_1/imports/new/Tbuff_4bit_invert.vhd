----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 10:55:46 PM
-- Design Name: 
-- Module Name: Tbuff_4bit_invert - Behavioral
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

entity Tbuff_4bit_invert is
--  Port ( );
end Tbuff_4bit_invert;
architecture behavioral of Tbuff_4bit_invert is
component TBuffer_2_1_4Bit_I is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,O : std_logic_vector(3 downto 0);
signal C:std_logic;
begin
UUT:TBuffer_2_1_4Bit_I port map(A,C,O);
process begin
A<="1111";
C<='1';
wait for 100 ns;
C<='0';
wait for 100 ns;
C<='1';
wait;

end process;
end Behavioral;
