----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 09:52:52 PM
-- Design Name: 
-- Module Name: TBuffer_2_1_4Bit - Behavioral
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
-- 4 bit inverted tri state buffer
entity TBuffer_2_1_4Bit_I is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end TBuffer_2_1_4Bit_I;

architecture Behavioral of TBuffer_2_1_4Bit_I is
signal C_invert:std_logic;
begin
C_invert<=not C;
O<=A when C_invert='1' else "ZZZZ";

end Behavioral;
