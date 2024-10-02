----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 11:06:00 PM
-- Design Name: 
-- Module Name: TB_MUXselector - Behavioral
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

entity TB_MUXselector is
--  Port ( );
end TB_MUXselector;

architecture Behavioral of TB_MUXselector is
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
signal Data0 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data1 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data2 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data3 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data4 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data5 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data6 :  STD_LOGIC_VECTOR (3 downto 0);
signal Data7 :  STD_LOGIC_VECTOR (3 downto 0);
signal Reg_A :  STD_LOGIC_VECTOR (2 downto 0);
signal Reg_B :  STD_LOGIC_VECTOR (2 downto 0);
signal Reg_JMP : STD_LOGIC_vector (3 downto 0);
signal A :  STD_LOGIC_VECTOR (3 downto 0);
signal B :  STD_LOGIC_VECTOR (3 downto 0);

begin
UUT:Data_Bus port map(Data0,Data1,Data2,Data3,Data4,Data5,Data6,Data7,Reg_A,Reg_B,Reg_JMP,A,B);
process begin
Data0<="0001";
Data1<="0010";
Data2<="0011";
Data3<="0100";
Data4<="0101";
Data5<="0110";
Data6<="0111";
Data7<="1000";
Reg_A<="000";
wait for 100 ns;
Reg_B<="001";
wait for 100 ns;
Reg_A<="010";
Reg_B<="011";
wait for 100 ns;
Reg_A<="101";
Reg_B<="111";
wait for 100 ns;
Reg_A<="101";
Reg_B<="111";
end process;
end Behavioral;
