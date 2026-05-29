----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Félix Bardey - Elio Bec-Clemente - Robin Brossat
-- 
-- Create Date: 29.05.2026 09:54:42
-- Design Name: 
-- Module Name: SignExtend - Behavioral
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

entity SignExtend is
    Port ( instruct : in STD_LOGIC_VECTOR (31 downto 0);
           imm : out STD_LOGIC_VECTOR (31 downto 0));
end SignExtend;

architecture Behavioral of SignExtend is

begin
    process (instruct)
    begin
        case instruct(6 downto 3) is
            when "0000" => --I
                imm(11 downto 0) <= instruct(31 downto 20);
                imm(31 downto 12) <= (others => instruct(31));
            when "0010" => --I
                imm(11 downto 0) <= instruct(31 downto 20);
                imm(31 downto 12) <= (others => instruct(31));
            when "0100" => --S
                imm(11 downto 0) <= instruct(31 downto 25) & instruct(11 downto 7); --[11:5|4:0] <=> [31:25|11:7]
                imm(31 downto 12) <= (others => instruct(31));
            when "1100" => --B
                imm(0) <= '0';
                imm(12 downto 1) <= instruct(31) & instruct(7) & instruct(30 downto 25) & instruct(11 downto 8); --[12|10:5|4:1|11] <=> [31|7|30:25|11:8]
                imm(31 downto 13) <= (others => instruct(31));
            when "1101" => --J
                imm(0) <= '0';
                imm(20 downto 1) <= instruct(31) & instruct(19 downto 12) & instruct(20) & instruct(30 downto 21); --[20|10:1|11|19:12] <=> [31|19:12|20|30:21]
                imm(31 downto 21) <= (others => instruct(31));  
        end case;
    end process;
end Behavioral;
