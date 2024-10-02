----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 08:40:14 AM
-- Design Name: 
-- Module Name: TBuffer_2_way_3 - Behavioral
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

-- 2 way mux using 2 tri state buffers
entity TBuffer_2_way_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end TBuffer_2_way_3;

architecture Behavioral of TBuffer_2_way_3 is
-- Non inverted control tristate buffer to output the same input under '1' signal
component TBuffer_3_Bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;
-- Inverted control tristate buffer to output the same input under '0' signal
component TBuffer_3_Bit_I is
    Port ( B : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal A_out,B_out:STD_LOGIC_VECTOR (2 downto 0);
begin
TBuffer_3_Bit_1:TBuffer_3_Bit port map(B,C,B_out);
TBuffer_3_Bit_I_1:TBuffer_3_Bit_I PORT MAP(A,C,A_out);
O<= A_out;
O<= B_out;
end Behavioral;
