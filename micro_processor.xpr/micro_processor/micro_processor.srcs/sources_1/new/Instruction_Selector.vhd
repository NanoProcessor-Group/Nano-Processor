----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 11:51:43 AM
-- Design Name: 
-- Module Name: Instruction_Selector - Behavioral
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

entity Instruction_Selector is
    Port ( Reset : in STD_LOGIC;
           JMP_F : in STD_LOGIC;
           JMP_Add : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Selector;

architecture Behavioral of Instruction_Selector is

--Tri state buffer for selecting instructions between jump address and normal counting
component TBuffer_2_way_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end component;

-- Get output and Reset when button pushed
component Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clk : in std_logic;
           M_in : in STD_LOGIC_VECTOR (2 downto 0);
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

-- Increment instruction register
component RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           --B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;
signal mem_out,adder_out,Mux_out:STD_LOGIC_VECTOR (2 downto 0);

begin
Program_Counter_0:Program_Counter port map(Reset,Clk,Mux_out,mem_out);
RCA_3_0:RCA_3 port map(mem_out,adder_out);
TBuffer_2_way_3_0:TBuffer_2_way_3 port map(adder_out,JMP_Add,JMP_F,Mux_out);
M_Sel<=mem_out;
end Behavioral;
