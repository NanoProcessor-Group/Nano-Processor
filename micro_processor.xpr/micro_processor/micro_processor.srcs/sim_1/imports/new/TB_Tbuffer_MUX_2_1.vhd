----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 11:00:44 PM
-- Design Name: 
-- Module Name: TB_Tbuffer_MUX_2_1 - Behavioral
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

entity TB_Tbuffer_MUX_2_1 is
--  Port ( );
end TB_Tbuffer_MUX_2_1;

architecture Behavioral of TB_Tbuffer_MUX_2_1 is
component Mux_2_1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal A :  STD_LOGIC_VECTOR (3 downto 0);
signal B :  STD_LOGIC_VECTOR (3 downto 0);
signal C :  STD_LOGIC;
signal O :  STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:Mux_2_1 port map(A,B,C,O);
process begin
A<="1011";
B<="1111";
C<='1';
wait for 200 ns;
C<='0';
wait for 200 ns;
C<='1';
wait;
end process;
end Behavioral;
