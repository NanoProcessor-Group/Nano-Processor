----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 04:45:18 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

-- Ripple carry adder that capable of adding 3 bit number
-- Used for incrementing instruction counter signal
entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is

-- Full adders used for creating RCA
component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component; 
 
 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C : std_logic;
begin

FA_1 : FA
 port map (
 A => A(0),
 B => '1', -- Incrementing step
 C_in => '0', -- Set to ground
 S => S(0),
 C_Out => FA0_C); 
 
 FA_2 : FA
  port map (
  A => A(1),
  B => '0',
  C_in => FA0_C,
  S => S(1),
  C_Out => FA1_C);
  
  FA_3 : FA
   port map (
   A => A(2),
   B => '0',
   C_in => FA1_C,
   S => S(2),
   C_Out => C_out);
   


end Behavioral;
