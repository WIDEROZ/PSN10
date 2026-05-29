----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 08.05.2025 12:31:17
-- Design Name: 
-- Module Name: testbenchAdder32bits - Behavioral
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

entity testbenchAdder32bits is
--  Port ( );
end testbenchAdder32bits;

architecture Behavioral of testbenchAdder32bits is
    signal input0, input1, output : STD_LOGIC_VECTOR(31 downto 0);
    
    component Adder32bits is
    Port ( input0 : in STD_LOGIC_VECTOR (31 downto 0);
           input1 : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    
    DUT: Adder32bits
    port map (
        input0 => input0,
        input1 => input1,
        output => output
    );
    
    stimuli_process: process
    begin
        input0<=(others => '0');
        input1<=(others => '0');
        wait for 100 ns;
        input1<=x"00000001";
        wait for 10 ns;
        input0<=x"00000010";
        wait for 10 ns;
        wait for 10 ns;
        input0<=(others => '1');
        wait for 10 ns;
        input1<=(others => '1');
        wait;
    end process;
        

end Behavioral;
