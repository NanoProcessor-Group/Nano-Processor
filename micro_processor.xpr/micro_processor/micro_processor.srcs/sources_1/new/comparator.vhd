----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2024 05:28:57 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

-- comparator for comparision of two values selected by Data Bus
entity comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_less : out STD_LOGIC;
           A_equal : out STD_LOGIC;
           A_greater : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

signal vA_equal:std_logic_vector (3 downto 0);
signal vA_less: std_logic;
begin

vA_less<= '1' when(A(3)='1' and B(3)='0') else '0';
A_less<='1' when(vA_less='1' or (A(3)='1' and B(3)='1' and    A(2 downto 0)<B(2 downto 0)) or ( A(3)='0' and B(3)='0' and A(2 downto 0)<B(2 downto 0)) ) else '0';
A_equal<='1' when (A=B) else '0';
A_greater<='1' when((A(3)='0' and B(3)='1') or (A(3)='1' and B(3)='1' and    A(2 downto 0)>B(2 downto 0)) or ( A(3)='0' and B(3)='0' and A(2 downto 0)>B(2 downto 0))) else '0';

end Behavioral;
