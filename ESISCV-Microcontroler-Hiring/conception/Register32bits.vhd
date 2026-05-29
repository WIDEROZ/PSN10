----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 06.05.2025 11:45:31
-- Design Name: 
-- Module Name: Register32bits - Behavioral
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

entity Register32bits is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end Register32bits;

architecture Behavioral of Register32bits is
    signal registed_value : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if (clk'event and clk='1') then
            if enable = '1' then
                registed_value <= input;
            end if;
        end if;
    end process;
    
    output <= registed_value;
    
end Behavioral;
