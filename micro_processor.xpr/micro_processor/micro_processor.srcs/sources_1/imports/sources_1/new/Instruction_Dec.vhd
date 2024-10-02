----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 10:51:45 AM
-- Design Name: 
-- Module Name: Instruction_Dec - Behavioral
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

entity Instruction_Dec is
    Port ( Ins : in STD_LOGIC_VECTOR (13 downto 0);
           Reg_JMP : in STD_LOGIC_VECTOR (3 downto 0);
           L_Sel : out STD_LOGIC;
           Immediate : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
           A_S_Sel : out STD_LOGIC;
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           JMP_F : out STD_LOGIC;
           JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
           A_S_En:out std_logic);
end Instruction_Dec;

architecture Behavioral of Instruction_Dec is
signal insts:std_logic_vector(3 downto 0);
signal regA,regB:std_logic_vector(2 downto 0);
--signal value:std_logic_vector(3 downto 0);
signal vJMP_F,v1L_Sel,v2L_Sel,default_L_Sel,v1A_S_Sel,v2A_S_Sel,v3A_S_Sel:std_logic;
signal vReg_En,default_vector,vReg_Sel_B,vReg_Sel_A:std_logic_vector(2 downto 0);
begin
    -- Decode the instruction
    Immediate <= Ins(3 downto 0); -- This is always directly decoded from Ins
    insts <= Ins(13 downto 10); --OP_code extraction
    regA <= Ins(9 downto 7);    -- Register A signal extraction
    regB <= Ins(6 downto 4);    -- Register B signal extraction
    Reg_En<=regA;               -- Register enable output extraction
 -- Load selector between immediate and Adder/Subtractor output
    -- Load selector ''0' output selection
    v1L_Sel<=not(insts(3) or insts(2) or insts(1)) or ( not(insts(3) or insts(1) or insts(0)) and insts(2) );
    -- Undefine Load selector output when not '0' using undefined signal
    v2L_Sel<=not v1L_Sel when (v1L_Sel='1') else default_L_Sel;
    -- Assign '1' to load selector for suitable operations. So It will only output '1' and '0' for prefered instructions and undefined at other instructions
    L_Sel <= insts(1) and not (insts(3) or insts(2) or insts(0)) when(insts(1)='1' and insts(3)='0' and insts(2)='0' and insts(0)='0')  else v2L_Sel;
    
 -- JMP_Flag output 
    JMP_F <= ( NOT(insts(3)) AND not insts(2) AND insts(1) AND (insts(0)) AND ( NOT ( Reg_JMP(3) or Reg_JMP(2) or Reg_JMP(1) or Reg_JMP(0) ))) OR (not insts(3) AND insts(2) AND  insts(1) AND NOT(insts(0)));
 
 -- JMP_Address get by last 3 bits   
    JMP_Add<=Ins(2 downto 0);
 
 -- RegSel_A output to give to Register select from register bank to give input to Adder/Subtractor   
    vReg_Sel_A<="000" when ((not(insts(3) or insts(2) or insts(1)) and insts(0))='1') else default_vector;
    Reg_Sel_A <= regA when (NOT insts(3) AND (( not insts(1) and not insts(0)) or (not insts(2)and insts(1) and insts(0) ) ))='1' else vReg_Sel_A;
    
 -- Reg_Selector for B
    -- Get regA or undefined to a signal. For RegA for RegA selecting moments and others as undefined
    vReg_Sel_B<=regA when (NOT(insts(3)) AND NOT(insts(2)) AND NOT insts(1) AND (insts(0)))='1' else default_vector;
    -- Get regB or regA or undefined as suitable
    Reg_Sel_B <=regB when (NOT(insts(3)) AND NOT(insts(1)) AND NOT(insts(0)) AND (insts(2) or not insts(2)))='1' else vReg_Sel_B;
 --Adder Subtractor Selector   
    v1A_S_Sel<= not (insts(3) or insts(2) or insts(1) or insts(0));
    v2A_S_Sel<= not v1A_S_Sel when (v1A_S_Sel='1') else default_L_Sel;
    v3A_S_Sel <= (NOT(insts(3)) AND NOT(insts(1)) and (insts(2) xor insts(0)));
    A_S_Sel<= v3A_S_Sel when (v3A_S_Sel='1') else v2A_S_Sel;  
    A_S_En<=NOT(insts(3) or insts(1) or insts(0));
end Behavioral;
