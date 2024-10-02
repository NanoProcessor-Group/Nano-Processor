----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 09:41:22 AM
-- Design Name: 
-- Module Name: Data_Bus - Behavioral
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

-- Use Regester select signal for A and B Register and get value
entity Data_Bus is
    Port ( Data0 : in STD_LOGIC_VECTOR (3 downto 0);
           Data1 : in STD_LOGIC_VECTOR (3 downto 0);
           Data2 : in STD_LOGIC_VECTOR (3 downto 0);
           Data3 : in STD_LOGIC_VECTOR (3 downto 0);
           Data4 : in STD_LOGIC_VECTOR (3 downto 0);
           Data5 : in STD_LOGIC_VECTOR (3 downto 0);
           Data6 : in STD_LOGIC_VECTOR (3 downto 0);
           Data7 : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_A : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_B : in STD_LOGIC_VECTOR (2 downto 0);
           Reg_JMP : out STD_LOGIC_vector (3 downto 0);
           A : out STD_LOGIC_VECTOR (3 downto 0);
           B : out STD_LOGIC_VECTOR (3 downto 0));
end Data_Bus;

architecture Behavioral of Data_Bus is
component Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0); 
           D0,D1,D2,D3,D4,D5,D6,D7 : in std_logic_vector (3 downto 0);    
           Y : out STD_LOGIC_vector(3 downto 0));
end component;
signal register_A:std_logic_vector (3 downto 0);
begin
Mux_8_to_1_A:Mux_8_to_1 port map(Reg_A,Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7,register_A);
Mux_8_to_1_B:Mux_8_to_1 port map(Reg_B,Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7,B);
A<=register_A;
Reg_JMP<=register_A;
end Behavioral;
