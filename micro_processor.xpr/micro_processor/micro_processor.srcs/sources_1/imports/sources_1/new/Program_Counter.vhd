----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 12:18:28 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Instruction counter.
-- Press Reset button to start from 000 instruction.
-- Output Mux or normal counting accordingly
-- Synchronized by a slow clock
entity Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in std_logic;
           M_in : in STD_LOGIC_VECTOR (2 downto 0);
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;


architecture Behavioral of Program_Counter is
begin
process(Clk, Reset)
    begin
        if Reset = '1' then -- check for Reset press
            -- Reset value
            M_Sel<="000";
        elsif rising_edge(Clk) then
            M_Sel<=M_in; -- Update register input from mux output         
        end if;
    end process;
end Behavioral;

