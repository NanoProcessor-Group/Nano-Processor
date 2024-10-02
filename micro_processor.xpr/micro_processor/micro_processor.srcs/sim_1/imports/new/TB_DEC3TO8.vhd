----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 11:46:37 PM
-- Design Name: 
-- Module Name: TB_DEC3TO8 - Behavioral
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

entity TB_DEC3TO8 is
--  Port ( );
end TB_DEC3TO8;

architecture Behavioral of TB_DEC3TO8 is
COMPONENT Decoder_3_to_8 is
    Port (
        I : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit input
        EN : in STD_LOGIC;                     -- Enable input
        Y : out STD_LOGIC_VECTOR (7 downto 0)  -- 8-bit output
    );
end COMPONENT;
SIGNAL I  : STD_LOGIC_VECTOR (2 downto 0);  
SIGNAL EN :  STD_LOGIC;                     
SIGNAL Y  :  STD_LOGIC_VECTOR (7 downto 0);  
begin
UUT:Decoder_3_to_8 PORT MAP(I,EN,Y);
PROCESS BEGIN
I<="000";
EN<='0';
WAIT FOR 100 NS;
EN<='1';
WAIT FOR 100 NS;
I<="001";
WAIT FOR 100 NS;
I<="010";
WAIT FOR 100 NS;
I<="011";
WAIT FOR 100 NS;
I<="100";
WAIT FOR 100 NS;
I<="101";
WAIT FOR 100 NS;
I<="110";
WAIT FOR 100 NS;
I<="111";
END PROCESS;

end Behavioral;
