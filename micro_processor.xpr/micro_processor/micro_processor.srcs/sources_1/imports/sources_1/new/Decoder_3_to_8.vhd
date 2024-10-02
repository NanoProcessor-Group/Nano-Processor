----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:26:21 PM
-- Design Name: 
-- Module Name: Decoder_3_to_8 - Behavioral
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

entity Decoder_3_to_8 is
    Port (
        I : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit input
        EN : in STD_LOGIC;                     -- Enable input
        Y : out STD_LOGIC_VECTOR (7 downto 0)  -- 8-bit output
    );
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
COMPONENT Decoder_2_to_4
PORT(I:IN STD_LOGIC_VECTOR;
EN:IN STD_LOGIC;
Y:OUT STD_LOGIC_VECTOR);
END COMPONENT;
signal I0, I1 : STD_LOGIC_VECTOR(1 downto 0);  -- Signals for the inputs of the nested decoders
signal Y0, Y1 : STD_LOGIC_VECTOR(3 downto 0);  -- Signals for the outputs of the nested decoders
signal en0, en1, I2 : STD_LOGIC;               -- Enable signals for the nested decoders and intermediate bit signal

begin
    Decode_2_to_4_0 :Decoder_2_to_4
        port map(
            I => I0,
            EN => en0,
            Y => Y0 
        );
    Decode_2_to_4_1 : Decoder_2_to_4
        port map(
            I => I1,
            EN => en1,
            Y => Y1 
        );
    -- Assignments for enable signals and connecting inputs to outputs
    en0 <= NOT(I(2)) AND EN;
    en1 <= I(2) AND EN;
    I0 <= I(1 downto 0);
    I1 <= I(1 downto 0);
    I2 <= I(2);
    Y(3 downto 0) <= Y0;
    Y(7 downto 4) <= Y1;

end Behavioral;
