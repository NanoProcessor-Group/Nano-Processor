----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2024 07:02:50 PM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
component Instruction_Selector is
    Port ( Reset : in STD_LOGIC;
           JMP_F : in STD_LOGIC;
           JMP_Add : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal Reset : std_logic :='1';
signal JMP_F : STD_LOGIC ;
signal   JMP_Add ,M_Sel: STD_LOGIC_VECTOR (2 downto 0);


 signal Clk_in,Clk_out :STD_LOGIC;

begin
UUT1:Slow_Clk port map(Clk_in,Clk_out);
UUT2:Instruction_Selector port map(Reset,JMP_F,JMP_Add,Clk_out,M_Sel);

process begin
Clk_in<='1';
wait for 2 ns;
Clk_in<='0';
wait for 2 ns;
end process;

process

    begin
        -- Test 1: Reset the program counter
        JMP_F<='0';
        Reset <= '1';
        wait for 10 ns; -- Give time for the reset to take effect
        Reset<='0';
        wait for 200 ns;
        JMP_F<='0';
        wait for 200 ns;
       JMP_F<='0';
        wait for 200 ns;
        JMP_F<='0';
        wait;
    end process;

end Behavioral;
