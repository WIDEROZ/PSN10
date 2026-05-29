----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 06.05.2025 13:28:28
-- Design Name: 
-- Module Name: SevenSegmentsPeripheral - Behavioral
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
use IEEE. NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegmentsPeripheral is
    Generic (
        peripheral_Addr : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"
    );
    Port ( 
           clk : in STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (31 downto 0);
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           A : out STD_LOGIC;
           B : out STD_LOGIC;
           C : out STD_LOGIC;
           D : out STD_LOGIC;
           E : out STD_LOGIC;
           F : out STD_LOGIC;
           G : out STD_LOGIC;
           AN0 : out STD_LOGIC;
           AN1 : out STD_LOGIC;
           AN2 : out STD_LOGIC;
           AN3 : out STD_LOGIC);
end SevenSegmentsPeripheral;

architecture Behavioral of SevenSegmentsPeripheral is
    type selector_segments is (a0, a1, a2, a3);
    signal counter : unsigned(31 downto 0) := (others => '0');
    signal selector : selector_segments := a0;
    signal value_stored : std_logic_vector(31 downto 0) := (others => '0');
    signal output : std_logic_vector(7 downto 0);
begin
register_process: process(clk)
    begin
        if (clk'event and clk = '1') then
            if WE = '1' and Addr = peripheral_Addr then
                value_stored <= WD;
            end if;
        end if;
    end process;
    
    counter_process: process(clk)
    begin
        if (clk'event and clk = '1') then
            if (counter >= x"00010000") then
                counter <= (others => '0');
                case selector is
                    when a0 => selector <= a1;
                    when a1 => selector <= a2;
                    when a2 => selector <= a3;
                    when others => selector <= a0;
                end case;
            else
                counter <= counter +1;
            end if;
        end if;
    end process;
    
    output_process: process(selector, value_stored)
    begin
        if (selector = a0) then
            case value_stored(3 downto 0) is
                when x"0" => output <= "01000000";
                when x"1" => output <= "01111001";
                when x"2" => output <= "00100100";
                when x"3" => output <= "00110000";
                when x"4" => output <= "00011001";
                when x"5" => output <= "00010010";
                when x"6" => output <= "00000010";
                when x"7" => output <= "01111000";
                when x"8" => output <= "00000000";
                when x"9" => output <= "00010000";
                when x"a" => output <= "00001000";
                when x"b" => output <= "00000011";
                when x"c" => output <= "01000110";
                when x"d" => output <= "00100001";
                when x"f" => output <= "00001110";
                when others => output <= "00000110";
            end case;
        elsif (selector = a1) then
            case value_stored(7 downto 4) is
                when x"0" => output <= "01000000";
                when x"1" => output <= "01111001";
                when x"2" => output <= "00100100";
                when x"3" => output <= "00110000";
                when x"4" => output <= "00011001";
                when x"5" => output <= "00010010";
                when x"6" => output <= "00000010";
                when x"7" => output <= "01111000";
                when x"8" => output <= "00000000";
                when x"9" => output <= "00010000";
                when x"a" => output <= "00001000";
                when x"b" => output <= "00000011";
                when x"c" => output <= "01000110";
                when x"d" => output <= "00100001";
                when x"f" => output <= "00001110";
                when others => output <= "00000110";
            end case;
        elsif (selector = a2) then
            case value_stored(11 downto 8) is
                when x"0" => output <= "01000000";
                when x"1" => output <= "01111001";
                when x"2" => output <= "00100100";
                when x"3" => output <= "00110000";
                when x"4" => output <= "00011001";
                when x"5" => output <= "00010010";
                when x"6" => output <= "00000010";
                when x"7" => output <= "01111000";
                when x"8" => output <= "00000000";
                when x"9" => output <= "00010000";
                when x"a" => output <= "00001000";
                when x"b" => output <= "00000011";
                when x"c" => output <= "01000110";
                when x"d" => output <= "00100001";
                when x"f" => output <= "00001110";
                when others => output <= "00000110";
            end case;
        else
            case value_stored(15 downto 12) is
                when x"0" => output <= "01000000";
                when x"1" => output <= "01111001";
                when x"2" => output <= "00100100";
                when x"3" => output <= "00110000";
                when x"4" => output <= "00011001";
                when x"5" => output <= "00010010";
                when x"6" => output <= "00000010";
                when x"7" => output <= "01111000";
                when x"8" => output <= "00000000";
                when x"9" => output <= "00010000";
                when x"a" => output <= "00001000";
                when x"b" => output <= "00000011";
                when x"c" => output <= "01000110";
                when x"d" => output <= "00100001";
                when x"f" => output <= "00001110";
                when others => output <= "00000110";
            end case;
        end if;
    end process;
    
    an_process: process(selector)
    begin
        case selector is
            when a0 =>
                AN0 <= '0';
                AN1 <= '1';
                AN2 <= '1';
                AN3 <= '1';
            when a1 =>
                AN0 <= '1';
                AN1 <= '0';
                AN2 <= '1';
                AN3 <= '1';
            when a2 =>
                AN0 <= '1';
                AN1 <= '1';
                AN2 <= '0';
                AN3 <= '1';
            when others =>
                AN0 <= '1';
                AN1 <= '1';
                AN2 <= '1';
                AN3 <= '0';
    end case;
    end process;
    
    A <= output(0);
    B <= output(1);
    C <= output(2);
    D <= output(3);
    E <= output(4);
    F <= output(5);
    G <= output(6);

end Behavioral;
