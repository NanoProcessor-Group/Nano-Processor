----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 01:35:15 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4 - Behavioral
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

entity Decoder_2_to_4 is
    Port (
        I : in STD_LOGIC_VECTOR(1 downto 0);  -- Input signal
        EN : in STD_LOGIC;                    -- Enable signal
        Y : out STD_LOGIC_VECTOR(3 downto 0)  -- Output signals
    );
end Decoder_2_to_4;

architecture Behavioral of Decoder_2_to_4 is
begin
    -- Decode input I based on EN signal to produce a 4-bit output
    Y(0) <= (NOT I(0)) AND (NOT I(1)) AND EN; -- Active when I = "00" and EN is high
    Y(1) <= I(0) AND (NOT I(1)) AND EN;       -- Active when I = "01" and EN is high
    Y(2) <= (NOT I(0)) AND I(1) AND EN;       -- Active when I = "10" and EN is high
    Y(3) <= I(0) AND I(1) AND EN;             -- Active when I = "11" and EN is high
end Behavioral;
