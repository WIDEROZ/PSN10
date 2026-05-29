----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 06.05.2025 11:45:31
-- Design Name: 
-- Module Name: MUX2x32bits - Behavioral
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

entity MUX2x32bits is
    Port ( sel : in STD_LOGIC;
           input0 : in STD_LOGIC_VECTOR (31 downto 0);
           input1 : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end MUX2x32bits;

architecture Behavioral of MUX2x32bits is

begin

    output<=input1 when sel='1' else input0;

end Behavioral;
