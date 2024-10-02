----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 10:47:26 PM
-- Design Name: 
-- Module Name: TBuff_4bit_n - Behavioral
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

entity TBuff_4bit_n is
--  Port ( );
end TBuff_4bit_n;

architecture Behavioral of TBuff_4bit_n is
component TBuffer_2_1_4Bit is
    Port ( B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal B,O : std_logic_vector(3 downto 0);
signal C:std_logic;
begin
UUT:TBuffer_2_1_4Bit port map(B,C,O);
process begin
B<="1111";
C<='1';
wait for 100 ns;
C<='0';
wait for 100 ns;
C<='1';
wait;

end process;
end Behavioral;
