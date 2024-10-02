----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 09:19:24 AM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is
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

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal regen: std_logic_vector (2 downto 0);
signal data , out0,out1,out2,out3,out4,out5,out6,out7 : std_logic_vector(3 downto 0);
signal clk_in,clk_out,Reset : std_logic;
begin
UUT_sc:Slow_Clk port map(clk_in,clk_out);
UUT_rb:Reg_Bank port map(clk_out,Reset,regen,data,out0,out1,out2,out3,out4,out5,out6,out7);

process begin
clk_in<='1';
wait for 3 ns;
clk_in<='0';
wait for 3 ns;
end process;

process begin
Reset<='1';
wait for 500 ns;
Data<="1010";
regen<="000";
wait for 100 ns;
regen<="001";
wait for 100 ns;
regen<="010";
wait for 100 ns;
regen<="011";
wait for 100 ns;
regen<="100";
wait for 100 ns;
regen<="101";
wait for 100 ns;
regen<="110";
wait for 100 ns;
regen<="111";
wait;


end process;
end Behavioral;
