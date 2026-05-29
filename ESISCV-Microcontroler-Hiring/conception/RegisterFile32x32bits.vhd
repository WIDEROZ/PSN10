----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 08.05.2025 13:30:00
-- Design Name: 
-- Module Name: RegisterFile32x32bits - Behavioral
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

entity RegisterFile32x32bits is
    Port ( clk : in STD_LOGIC;
           Addr1 : in STD_LOGIC_VECTOR (4 downto 0);
           Addr2 : in STD_LOGIC_VECTOR (4 downto 0);
           Addr3 : in STD_LOGIC_VECTOR (4 downto 0);
           WE3 : in STD_LOGIC;
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           RD1 : out STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile32x32bits;

architecture Behavioral of RegisterFile32x32bits is
    type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
    signal registers : registerFile := (
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000",
        x"00000000");
begin
    write_process: process(clk)
    begin
        if clk'event and clk='1' then
            
            if WE3 = '1' then
                if Addr3 /= "00000" then
                    registers(to_integer(unsigned(Addr3))) <= WD3;
                end if;
            end if;
        end if;
    end process;
    
    read_process: process(Addr1, Addr2)
    begin
        if Addr1 = "00000" then
            RD1 <= (others => '0');
        else
            RD1 <= registers(to_integer(unsigned(Addr1)));
        end if;
        if Addr2 = "00000" then
            RD2 <= (others => '0');
        else
            RD2 <= registers(to_integer(unsigned(Addr2)));
        end if;
    end process;
end Behavioral;
