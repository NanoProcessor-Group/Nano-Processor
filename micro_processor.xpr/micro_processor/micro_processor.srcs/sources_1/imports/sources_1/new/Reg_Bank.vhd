library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Reg_Bank is
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

end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal Dec_out : STD_LOGIC_VECTOR (7 downto 0);
signal En0,En1,En2,En3,En4,En5,En6,En7 : std_logic;
signal vData,vData_Out7 : std_logic_vector (3 downto 0);

begin
-- Assign 0000 in all register when reset button pushed
vData<= "0000" when (Reset='1') else Data;
En0<= '1' when (Reset='1') else '0';
En1<='1' when (Reset='1') else Dec_out(1);
En2<='1' when (Reset='1') else Dec_out(2);
En3<='1' when (Reset='1') else Dec_out(3);
En4<='1' when (Reset='1') else Dec_out(4);
En5<='1' when (Reset='1') else Dec_out(5);
En6<='1' when (Reset='1') else Dec_out(6);
En7<='1' when (Reset='1') else Dec_out(7);
Decoder_3_to_80:Decoder_3_to_8 port map(Reg_En,'1',Dec_out);
Reg0:Reg port map(vData,En0,Clk,Data_Out0);
Reg1:Reg port map(vData,En1,Clk,Data_Out1);
Reg2:Reg port map(vData,En2,Clk,Data_Out2);
Reg3:Reg port map(vData,En3,Clk,Data_Out3);
Reg4:Reg port map(vData,En4,Clk,Data_Out4);
Reg5:Reg port map(vData,En5,Clk,Data_Out5);
Reg6:Reg port map(vData,En6,Clk,Data_Out6);
Reg7:Reg port map(vData,En7,Clk,vData_Out7);
-- output R7 register for used in led seveng segment display
Data_Out7<=vData_Out7;

end Behavioral;