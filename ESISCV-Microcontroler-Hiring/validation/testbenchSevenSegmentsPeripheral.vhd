----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 13.05.2025 15:23:17
-- Design Name: 
-- Module Name: testbenchSevenSegmentsPeripheral - Behavioral
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

entity testbenchSevenSegmentsPeripheral is
--  Port ( );
end testbenchSevenSegmentsPeripheral;

architecture Behavioral of testbenchSevenSegmentsPeripheral is
    signal clk : STD_LOGIC := '0';
    signal A, B, C, D, E, F, G : STD_LOGIC;
    signal AN0, AN1, AN2, AN3: STD_LOGIC;
    signal WE : STD_LOGIC := '0';
    signal Addr : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal WD : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    
    component SevenSegmentsPeripheral is
    Generic (
        peripheral_Addr : STD_LOGIC_VECTOR(31 downto 0) := x"00010000"
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
    end component;

begin
    
    peripheral : SevenSegmentsPeripheral
    generic map (
        peripheral_Addr => x"00000100"
    )
    port map ( 
           clk => clk,
           Addr => Addr,
           WD => WD,
           WE => WE,
           A => A,
           B => B,
           C => C,
           D => D,
           E => E,
           F => F,
           G => G,
           AN0 => AN0,
           AN1 => AN1,
           AN2 => AN2,
           AN3 => AN3
    );
    
    stimuli_process : process
    begin
        wait for 15 ns;
        WD <= x"00000001";
        wait for 10 ns;
        WE <= '1';
        wait for 10 ns;
        WE <= '0';
        wait for 15 ns;
        Addr <= x"00000100";
        WD <= x"00000002";
        wait for 10 ns;
        WD <= x"00000003";
        WE <= '1';
        wait for 10 ns;
        WE <= '0';
        WD <= x"00000004";
    end process;        

    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;


end Behavioral;
