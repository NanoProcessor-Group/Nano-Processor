----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 02:32:23 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

-- Full adder
entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
COMPONENT HA
PORT(A,B: IN STD_LOGIC;
    S,C: OUT STD_LOGIC

);
END COMPONENT;
SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : std_logic;
begin
HA_0 : HA
 port map (
 A => A,
 B => B,
 S => HA0_S,
 C => HA0_C);
 
 HA_1 : HA
  port map (
  A => HA0_S,
  B => C_in,
  S => HA1_S,
  C => HA1_C); 
S<=HA1_S;
C_out <= HA1_C OR HA0_C;
end Behavioral;
