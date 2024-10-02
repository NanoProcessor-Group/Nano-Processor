----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2024 05:11:34 PM
-- Design Name: 
-- Module Name: TB_Ins - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Ins is
--  Port ( );
end TB_Ins;

architecture Behavioral of TB_Ins is
component Instruction_Dec is
    Port ( Ins : in STD_LOGIC_VECTOR (13 downto 0);
           Reg_JMP : in STD_LOGIC_VECTOR (3 downto 0);
           L_Sel : out STD_LOGIC;
           Immediate : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           A_S_Sel : out STD_LOGIC;
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           JMP_F : out STD_LOGIC;
           JMP_Add : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal Ins:STD_LOGIC_VECTOR (13 downto 0);
signal Reg_En,Reg_Sel_A,Reg_Sel_B,JMP_Add:STD_LOGIC_VECTOR (2 downto 0);
signal Immediate,Reg_JMP:STD_LOGIC_VECTOR (3 downto 0);
signal JMP_F,L_Sel,A_S_Sel:STD_LOGIC;
begin
UUT:Instruction_Dec port map(Ins=>Ins,A_S_Sel=>A_S_Sel,L_Sel=>L_Sel,Reg_JMP=>Reg_JMP,Reg_En=>Reg_En,Immediate=>Immediate,Reg_Sel_A=>Reg_Sel_A,Reg_Sel_B=>Reg_Sel_B,JMP_F=>JMP_F,JMP_Add=>JMP_Add);
process begin
Ins<="00101010000110";
wait for 100 ns;
Ins<="00101111010001";
wait for 100 ns;
Ins<="00101100000100";
wait for 100 ns;
Ins<="00001111100000";
wait for 100 ns;
Reg_JMP<="0000";
Ins<="00111110000001";
wait for 100 ns;
Ins<="00100000000001";
wait for 100 ns;
Ins<="00001110000000";
wait for 100 ns;
Ins<="01001111000000";
wait for 100 ns;
Ins<="01010000000000";
wait for 100 ns;
Ins<="01100000000100";
wait for 100 ns;
end process;

end Behavioral;
