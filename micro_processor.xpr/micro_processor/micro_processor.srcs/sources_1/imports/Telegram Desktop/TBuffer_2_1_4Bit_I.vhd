----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 09:55:22 PM
-- Design Name: 
-- Module Name: TBuffer_2_1_4Bit_I - Behavioral
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

-- 4 bit normal singal controlled tri state buffer
entity TBuffer_2_1_4Bit is
    Port ( B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (3 downto 0));
end TBuffer_2_1_4Bit;

architecture Behavioral of TBuffer_2_1_4Bit is

begin

O <= B when C='1' else "ZZZZ";

end Behavioral;
