----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 08.05.2025 12:31:17
-- Design Name: 
-- Module Name: testbenchRegister32bits - Behavioral
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

entity testbenchRegister32bits is
--  Port ( );
end testbenchRegister32bits;

architecture Behavioral of testbenchRegister32bits is
    signal clk, enable : STD_LOGIC := '0';
    signal input, output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    
    component Register32bits is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           input : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    
    DUT: Register32bits
    port map (
        clk => clk,
        enable => enable,
        input => input,
        output => output
    );
    
    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    
    stimuli_process: process
    begin
        wait for 105 ns;
        input<=x"00000001";
        wait for 100 ns;
        enable<='1';
        wait for 100 ns;
        input<=x"00000010";
        wait for 10 ns;
        enable<='0';
        input<=x"00000011";
        wait;
    end process;

end Behavioral;
