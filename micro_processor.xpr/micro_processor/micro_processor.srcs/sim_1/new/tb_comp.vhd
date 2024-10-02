----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 05:59:48 PM
-- Design Name: 
-- Module Name: tb_comp - Behavioral
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

entity tb_comp is
--  Port ( );
end tb_comp;

architecture Behavioral of tb_comp is
component comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_less : out STD_LOGIC;
           A_equal : out STD_LOGIC;
           A_greater : out STD_LOGIC);
end component;
signal A,B :  STD_LOGIC_VECTOR (3 downto 0);
signal     A_greater,   A_equal,   A_less : STD_LOGIC;
begin
UUT:comparator port map(A,B,A_less,A_equal,A_greater);
process begin
A<="0100";
B<="0100";
wait for 100 ns;
A<="1111";
B<="1111";
wait for 100 ns;
A<="0100";
B<="1111";
wait for 100 ns;
A<="1100";
B<="1011";
wait;
end process;

end Behavioral;
