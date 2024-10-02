----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:28:18 AM
-- Design Name: 
-- Module Name: MUX_2_way_4 - Behavioral
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

-- 2 way 4 bit mux as load selector
entity MUX_2_way_4 is
    Port (
        Immediate : in STD_LOGIC_VECTOR (3 downto 0);  -- Immediate input data
        Result : in STD_LOGIC_VECTOR (3 downto 0);     -- Result input data
        L_Sel : in STD_LOGIC;                          -- Selector input
        Data_Out : out STD_LOGIC_VECTOR (3 downto 0)   -- Output data
    );
end MUX_2_way_4;

architecture Behavioral of MUX_2_way_4 is
    -- Logic to determine output based on selector L_Sel
begin
    Data_Out(0)<=(not L_Sel and Result(0)) or (L_Sel and Immediate(0));
    Data_Out(1)<=(not L_Sel and Result(1)) or (L_Sel and Immediate(1));
    Data_Out(2)<=(not L_Sel and Result(2)) or (L_Sel and Immediate(2));
    Data_Out(3)<=(not L_Sel and Result(3)) or (L_Sel and Immediate(3));
end Behavioral;
