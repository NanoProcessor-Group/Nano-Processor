----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 10:00:10 PM
-- Design Name: 
-- Module Name: Mux_2_1 - Behavioral
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
-- 2 way mux using two inverted and normal signal controlled tri state buffers
entity Mux_2_1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_1;

architecture Behavioral of Mux_2_1 is

component TBuffer_2_1_4Bit_I is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component TBuffer_2_1_4Bit is
    Port ( B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A_out,B_out:STD_LOGIC_VECTOR (3 downto 0);

begin
TBuffer_2_1_4Bit_I_0: TBuffer_2_1_4Bit_I port map(A,C,A_out);
TBuffer_2_1_4Bit_0: TBuffer_2_1_4Bit PORT MAP(B,C,B_out);
O<= A_out;
O<= B_out;
end Behavioral;
