----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2024 04:22:51 PM
-- Design Name: 
-- Module Name: TB_MUX_4_T_Buf - Behavioral
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

entity TB_MUX_4_T_Buf is
--  Port ( );
end TB_MUX_4_T_Buf;

architecture Behavioral of TB_MUX_4_T_Buf is
component MUX_2_way_4 is
    Port ( Immediate : in STD_LOGIC_VECTOR (3 downto 0);
           Result : in STD_LOGIC_VECTOR (3 downto 0);
           L_Sel : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal A,B : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC;
signal O : STD_LOGIC_VECTOR (3 downto 0);  -- Initialize O

begin
UUT: MUX_2_way_4 port map(Immediate=>A,Result => B, L_Sel => C, Data_Out => O);

process
begin
A<="1010";
B<="1110";
C<='1';
wait for 500 ns;
C<='0';
wait;
end process;
end Behavioral;