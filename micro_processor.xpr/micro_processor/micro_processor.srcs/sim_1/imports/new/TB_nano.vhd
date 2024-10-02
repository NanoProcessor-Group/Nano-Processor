----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 05:59:44 PM
-- Design Name: 
-- Module Name: TB_nano - Behavioral
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

entity TB_nano is
--  Port ( );
end TB_nano;

architecture Behavioral of TB_nano is
component Processor is
    Port ( Clkin : in STD_LOGIC;
           Data7_LED: out std_logic_vector (3 downto 0);
           Overflow ,Zero,Carry,A_less,A_equal,A_greater: out std_logic;
           Reset : in STD_LOGIC;
           Seven_S:out std_logic_vector (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal  Clkin : STD_LOGIC;
signal  Data7_LED: std_logic_vector (3 downto 0);
signal  Overflow ,Zero,Carry,A_less,A_equal,A_greater:std_logic;
signal  Reset : STD_LOGIC;
signal Seven_S: std_logic_vector (6 downto 0);
signal Anode : STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:Processor port map(Clkin,Data7_LED,Overflow ,Zero,Carry,A_less,A_equal,A_greater,Reset,Seven_S,Anode);
process begin
Clkin<='1';
wait for 3 ns;
Clkin<='0';
wait for 3 ns;
end process;
process begin
Reset<='1';
wait for 100 ns;
Reset<='0';
wait;
end process;

end Behavioral;
