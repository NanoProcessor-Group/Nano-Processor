----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 06:02:58 PM
-- Design Name: 
-- Module Name: add_sub_sim - Behavioral
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

entity add_sub_sim is
--  Port ( );
end add_sub_sim;

architecture Behavioral of add_sub_sim is
component RCA_4 is
    Port ( 
            A: in STD_LOGIC_VECTOR (3 downto 0) ;
            B:in STD_LOGIC_VECTOR (3 downto 0);
           OP : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlow,Zero: out STD_LOGIC);
end component;
signal a,b,s :std_logic_vector (3 downto 0);
signal op,o_f,zero:std_logic;
begin
UUT :RCA_4 port map(
A=>a,
B=>b,
OP=>op,
S=>s,
OverFlow=>o_f,
Zero=>zero
);
process begin
a<="0001";
b<="0001";
op<='1';
wait for 100 ns;
a<="0000";
b<="0000";
op<='0';
wait for 100 ns;
b<="1001";
a<="1001";

wait for 100 ns;
op<='1';
wait;

end process;
end Behavioral;
