----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Félix Bardey - Elio Bec-Clemente - Robin Brossat
-- 
-- Create Date: 29.05.2026 09:31:04
-- Design Name: 
-- Module Name: ALU32bits - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU32bits is
    Port ( mode : in STD_LOGIC_VECTOR (2 downto 0);
           SrcA : in STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end ALU32bits;

architecture Behavioral of ALU32bits is

begin
    process (mode, SrcA, SrcB)
    begin
        case mode is
            when "001" => output <= SrcA + SrcB;--add
            when "010" => output <= SrcA - SrcB;--sub
            when "011" => --equal
                if(SrcA = SrcB) then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
            when "100" => --not equal
                if(SrcA /= SrcB) then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
            when "101" => --lower than
                if(SrcA < SrcB) then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
            when "110" => --greater or equal than
                if(SrcA >= SrcB) then
                    zero <= '1';
                else
                    zero <= '0';
                end if;
            when others => --Autres : ne rien faire
        end case;
    end process;
end Behavioral;
