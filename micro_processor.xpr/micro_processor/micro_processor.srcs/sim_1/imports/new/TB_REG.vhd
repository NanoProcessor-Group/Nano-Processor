----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2024 11:54:53 PM
-- Design Name: 
-- Module Name: TB_REG - Behavioral
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

entity TB_REG is
--  Port ( );
end TB_REG;

architecture Behavioral of TB_REG is
COMPONENT Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
COMPONENT Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;

SIGNAL D :  STD_LOGIC_VECTOR (3 downto 0);
SIGNAL En :  STD_LOGIC;
SIGNAL  Clk_in,Clk_out: STD_LOGIC;
SIGNAL Q :  STD_LOGIC_VECTOR (3 downto 0);
begin
UUT:Reg PORT MAP(D,En,Clk_out,Q);
UUT1:Slow_Clk PORT MAP(Clk_in,Clk_out);
PROCESS BEGIN
Clk_in<='1';
wait for 3 ns;
Clk_in<='0';
wait for 3 ns;
end process;
process begin
D<="1001";
En<='1';
wait for 100 ns;
En<='0';
wait for 100 ns;
D<="1111";
En<='1';
wait for 100 ns;
En<='0';
END PROCESS;

end Behavioral;
