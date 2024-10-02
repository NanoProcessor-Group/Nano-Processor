----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2024 08:41:23 AM
-- Design Name: 
-- Module Name: TBuffer_3_Bit - Behavioral
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

entity TBuffer_3_Bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (2 downto 0));
end TBuffer_3_Bit;

architecture Behavioral of TBuffer_3_Bit is

begin
O<=A when (C='1') else "ZZZ";

end Behavioral;
