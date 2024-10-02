----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 08:55:06 AM
-- Design Name: 
-- Module Name: TB_tristate - Behavioral
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

entity TB_tristate is
--  Port ( );
end TB_tristate;

architecture Behavioral of TB_tristate is
component TBuffer_2_way_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A,B : STD_LOGIC_VECTOR (2 downto 0);
signal C : STD_LOGIC;
signal O : STD_LOGIC_VECTOR (2 downto 0);  -- Initialize O

begin
UUT: TBuffer_2_way_3 port map(A=>A,B => B, C => C, O => O);

process
begin
A<="101";
B<="111";
C<='1';
wait for 500 ns;
C<='0';
wait;
end process;
end Behavioral;