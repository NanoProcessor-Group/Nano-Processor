----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 03:55:37 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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
use IEEE.numeric_std.all;
-- 8 way mux using 2 way bux all in 4 bits
entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D0,D1,D2,D3,D4,D5,D6,D7 : in std_logic_vector (3 downto 0);
           Y : out STD_LOGIC_vector(3 downto 0));
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is


component Mux_2_1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL d12, d23, d45, d67, p, q:STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
Mux_2_1_A:Mux_2_1
    port map(D0,D1,S(0),d12);

Mux_2_1_B:Mux_2_1
    port map(D2,D3,S(0),d23);
    
Mux_2_1_C:Mux_2_1
        port map(D4,D5,S(0),d45);    

Mux_2_1_D:Mux_2_1
        port map(D6,D7,S(0),d67);   

Mux_2_1_E:Mux_2_1
        port map(d12,d23,S(1),p); 

Mux_2_1_F:Mux_2_1
        port map(d45,d67,S(1),q); 

Mux_2_1_G:Mux_2_1
        port map(p,q,S(2),Y);         
                
end Behavioral;
