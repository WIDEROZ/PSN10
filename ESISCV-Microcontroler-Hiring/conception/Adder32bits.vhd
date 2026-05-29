----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 06.05.2025 13:28:26
-- Design Name: 
-- Module Name: Adder32bits - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder32bits is
    Port ( input0 : in STD_LOGIC_VECTOR (31 downto 0);
           input1 : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end Adder32bits;

architecture Behavioral of Adder32bits is

begin
   output <= std_logic_vector(unsigned(input0)+unsigned(input1));
end Behavioral;
