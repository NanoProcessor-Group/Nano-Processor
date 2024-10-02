----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 12:04:44 PM
-- Design Name: 
-- Module Name: Program_Rom - Behavioral
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

entity Program_Rom is
    Port ( M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (13 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
    --         Instruction       --
    
-- NAME OP_CODE REG_A REG_B VALUE Description
-- movi   0010  111   000  1010   Move value to Register A
-- add    0000  111   101  0000   Final result will be saved in Register A
-- neg    0001  111   000  0000   Negative in two's complement is stored in Register A 
-- JZR    0011  111   000  0101   If Register A's value is Zero then jump to instruction given by last 3 bit
-- sub    0100  111   101  0000   Subtract Register B's value from Register A and stored in Register A
-- NOP    0101  000   000  0000   Pass clock cycle and do nothing
-- JMP    0110  000   000  0111   Jump to the instruction given by last 3 bits

type rom_type is array (0 to 7) of std_logic_vector(13 downto 0);
signal Instruction_ROM : rom_type := (
"00101110000001", -- 000
"00101000000010", -- 001
"01001111000000", -- 010
"01010000000000", -- 011
"00101110000100", -- 100
"00101110000101", -- 101
"00101110000110", -- 110
"01100000000100"); -- 111
begin

Ins<=Instruction_ROM(to_integer(unsigned(M_Sel)));
end Behavioral;
