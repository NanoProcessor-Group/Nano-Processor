----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 11:37:18 PM
-- Design Name: 
-- Module Name: TB_Dec2to4 - Behavioral
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

entity TB_Dec2to4 is
--  Port ( );
end TB_Dec2to4;

architecture Behavioral of TB_Dec2to4 is
component Decoder_2_to_4 is
    Port (
        I : in STD_LOGIC_VECTOR(1 downto 0);  -- Input signal
        EN : in STD_LOGIC;                    -- Enable signal
        Y : out STD_LOGIC_VECTOR(3 downto 0)  -- Output signals
    );
end component;
signal  I :  STD_LOGIC_VECTOR(1 downto 0);  
signal EN :  STD_LOGIC;                    
signal Y :   STD_LOGIC_VECTOR(3 downto 0);
begin
UUT:Decoder_2_to_4 port map(I,EN,Y);
process begin
I<="00";
EN<='0';
WAIT FOR 100 NS;
EN<='1';
WAIT FOR 100 NS;
I<="01";
WAIT FOR 100 NS;
I<="10";
WAIT FOR 100 NS;
I<="11";
WAIT FOR 100 NS;
I<="00";
EN<='0';
wait;
end process;

end Behavioral;
