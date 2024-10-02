----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 01:18:36 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
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


entity Processor is
    Port ( Clkin : in STD_LOGIC;
           Data7_LED: out std_logic_vector (3 downto 0);
           Overflow ,Zero,Carry,A_less,A_equal,A_greater: out std_logic;
           Reset : in STD_LOGIC;
           Seven_S:out std_logic_vector (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Processor;

architecture Behavioral of Processor is
component LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Instruction_Selector is
    Port ( Reset : in STD_LOGIC;
           JMP_F : in STD_LOGIC;
           JMP_Add : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in std_logic;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;


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
           JMP_Add : out STD_LOGIC_VECTOR (2 downto 0);
           A_S_En:out std_logic);
end component;
component Program_Rom is
    Port ( --Reg_Ins:in STD_LOGIC_VECTOR (11 downto 0);
           M_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (13 downto 0));
end component;

component MUX_2_way_4 is
    Port ( Immediate : in STD_LOGIC_VECTOR (3 downto 0);
           Result : in STD_LOGIC_VECTOR (3 downto 0);
           L_Sel : in STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Reg_Bank is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Data : in STD_LOGIC_VECTOR (3 downto 0);
           Data_Out0 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out1 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out2 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out3 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out4 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out5 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out6 : out STD_LOGIC_VECTOR (3 downto 0);
           Data_Out7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component Data_Bus is
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
end component;
component RCA_4 is
    Port ( 
            A: in STD_LOGIC_VECTOR (3 downto 0) ;
            B:in STD_LOGIC_VECTOR (3 downto 0);
            OP,En : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlow,Zero,Carry,A_less,A_equal,A_greater : out STD_LOGIC);
end component;


signal JMP_f,L_Sel,A_S_Sel,Clk,vA_S_En:std_logic;

signal A,B,Reg_check_JMP ,Immediate,Result,Data_Reg ,Reg_Data_Out0,Reg_Data_Out1,Reg_Data_Out2,Reg_Data_Out3,Reg_Data_Out4,Reg_Data_Out5,Reg_Data_Out6,Reg_Data_Out7  :std_logic_vector(3 downto 0);

signal JMPadd,msel,Reg_Sel_A,Reg_Sel_B,Reg_En :std_logic_vector(2 downto 0);

signal insts :std_logic_vector(13 downto 0);

begin
-- Program counter mapping
    Program_Counter_0:Instruction_Selector port map(Reset,JMP_f,JMPadd,Clk,msel);
    
-- Program Rom mapping
    Program_Rom_0:Program_Rom port map(msel,insts);
    
-- Instruction Decoder mapping
    Instruction_Dec_0:Instruction_Dec port map(insts,Reg_check_JMP,L_Sel,Immediate,Reg_Sel_A,Reg_Sel_B,A_S_Sel,Reg_En,JMP_f,JMPadd,vA_S_En);
    
-- Load selector mapping 
    Load_Selector:MUX_2_way_4 port map(Immediate,Result,L_Sel,Data_Reg);
    
-- Reg Bank mapping
    Reg_Bank_0:Reg_Bank port map(Clk,Reset,Reg_En,Data_Reg,Reg_Data_Out0,Reg_Data_Out1,Reg_Data_Out2,Reg_Data_Out3,Reg_Data_Out4,Reg_Data_Out5,Reg_Data_Out6,Reg_Data_Out7);
    
-- MUX Selector mapping    
    MUX_Selector:Data_Bus port map(Reg_Data_Out0,Reg_Data_Out1,Reg_Data_Out2,Reg_Data_Out3,Reg_Data_Out4,Reg_Data_Out5,Reg_Data_Out6,Reg_Data_Out7,Reg_Sel_A,Reg_Sel_B,Reg_check_JMP,A,B);

-- ALU mapping
    Arithmatic_and_Logic_Unit:RCA_4 port map(A,B,A_S_Sel,vA_S_En,Result,Overflow,Zero,Carry,A_less,A_equal,A_greater);

-- Slow Clock
    Slow_Clk_0:Slow_Clk port map(Clkin,Clk);

-- Seven segment lookup table
    Seven_Segment_LUT:LUT_16_7 port map(Reg_Data_Out7,Seven_S);
    
-- Led Output R7 register
Data7_LED<=Reg_Data_Out7;

-- Anode for seven segment
Anode <= "1110";

end Behavioral;
