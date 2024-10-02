----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 03:23:53 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( 
            A: in STD_LOGIC_VECTOR (3 downto 0) ;
            B:in STD_LOGIC_VECTOR (3 downto 0);
            OP,En : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
           OverFlow,Zero,Carry,A_less,A_equal,A_greater : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
component comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_less : out STD_LOGIC;
           A_equal : out STD_LOGIC;
           A_greater : out STD_LOGIC);
end component;

component FA
 port (
 A: in std_logic;
 B: in std_logic;
 C_in: in std_logic;
 S: out std_logic;
 C_out: out std_logic);
 end component; 
 
 SIGNAL vA_less,vA_equal,vA_greater,over_flow,FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,tempB0,tempB1,tempB2,tempB3,cout : std_logic;
 signal S_temp : std_logic_vector (3 downto 0);
begin
comparator_1:comparator port map(A,B,vA_less,vA_equal,vA_greater);
A_less<=vA_less and En;
A_equal<=vA_equal and En;
A_greater<=vA_greater and En;
tempB0<=B(0) XOR OP;
tempB1<=B(1) XOR OP;
tempB2<=B(2) XOR OP;
tempB3<=B(3) XOR OP;



FA_1 : FA
 port map (
 A => A(0),
 B =>tempB0,
 C_in => OP, -- Set to ground
 S => S_temp(0),
 C_Out => FA0_C); 
 
 FA_2 : FA
  port map (
  A => A(1),
  B => tempB1,
  C_in => FA0_C,
  S => S_temp(1),
  C_Out => FA1_C);
  
  FA_3 : FA
   port map (
   A => A(2),
   B =>tempB2,
   C_in => FA1_C,
   S => S_temp(2),
   C_Out => FA2_C);
   
   FA_4 : FA
    port map (
    A => A(3),
    B => tempB3,
    C_in => FA2_C,
    S => S_temp(3),
    C_Out => cout);
    S<=S_temp;
    over_flow<=cout XOR FA2_c;
    Carry<=cout;
    Zero <= not (S_temp(0) or S_temp(1) or S_temp(2) or S_temp(3) or over_flow) and En;
    OverFlow<=over_flow and En;
  
 end Behavioral;


