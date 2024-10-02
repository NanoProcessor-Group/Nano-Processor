----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 10:02:15 PM
-- Design Name: 
-- Module Name: TB_ALU - Behavioral
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

entity TB_ALU is
--  Port ( );
end TB_ALU;

architecture Behavioral of TB_ALU is
component RCA_4 is
    Port ( 
            A: in STD_LOGIC_VECTOR (3 downto 0) ;
            B:in STD_LOGIC_VECTOR (3 downto 0);
            OP,En : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlow,Zero,Carry,A_less,A_equal,A_greater : out STD_LOGIC);
end component;
signal A  :  STD_LOGIC_VECTOR (3 downto 0) ;
signal B  :  STD_LOGIC_VECTOR (3 downto 0);
signal OP,En :  STD_LOGIC;
signal S  :  STD_LOGIC_VECTOR (3 downto 0);
signal OverFlow,Zero,Carry,A_less,A_equal,A_greater :  STD_LOGIC;
begin
UUT:RCA_4 port map(A,B,OP,En,S, OverFlow,Zero,Carry,A_less,A_equal,A_greater);
process begin
En<='1';
A<="0001";
B<="0010";
OP<='0';
wait for 100 ns;
A<="1001";
B<="1000";
OP<='0';
wait for 100 ns;
A<="1101";
B<="1110";
OP<='0';
wait for 100 ns;
A<="0001";
B<="0010";
OP<='1';
wait for 100 ns;
A<="1001";
B<="1000";
OP<='1';
wait for 100 ns;
En<='0';
wait for 100 ns;
En<='1';
A<="1101";
B<="1110";
OP<='1';
wait for 100 ns;
A<="0000";
B<="0111";
wait for 100 ns;
A<="0100";
B<="0011";
wait;
wait;
end process;
end Behavioral;
