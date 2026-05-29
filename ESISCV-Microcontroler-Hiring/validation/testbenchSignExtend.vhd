----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2025 12:33:29
-- Design Name: 
-- Module Name: testbenchSignExtend - Behavioral
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

entity testbenchSignExtend is
--  Port ( );
end testbenchSignExtend;

architecture Behavioral of testbenchSignExtend is
    signal instruct, imm: STD_LOGIC_VECTOR(31 downto 0);
    
    component SignExtend is
    Port ( instruct : in STD_LOGIC_VECTOR (31 downto 0);
           imm : out STD_LOGIC_VECTOR(31 downto 0));
    end component;
begin

    DUT: SignExtend
    port map (
        instruct => instruct,
        imm => imm
    );
    
    stimuli_process: process  -- Content of testSignExtend.hex
    begin
        instruct <= x"fff00513";  -- addi a0, zero, -1
        wait for 10 ns;
        instruct <= x"00100513";  -- addi a0, zero, 1
        wait for 10 ns;
        instruct <= x"ffe12603";  -- lw a2, -2(sp)
        wait for 10 ns;
        instruct <= x"00212603";  -- lw a2, 2(sp)
        wait for 10 ns;
        instruct <= x"fec12e23";  -- sw a2, -4(sp)
        wait for 10 ns;
        instruct <= x"00c12223";  -- sw a2, 4(sp)
        wait for 10 ns;
        instruct <= x"fea58ce3";  -- beq a1, a0, -8
        wait for 10 ns;
        instruct <= x"00a58463";  -- beq a1, a0, 8
        wait for 10 ns;
        instruct <= x"fea59ae3";  -- bne a1, a0, -12
        wait for 10 ns;
        instruct <= x"00a59663";  -- bne a1, a0, 12
        wait for 10 ns;
        instruct <= x"fea5c8e3";  -- blt a1, a0, -16
        wait for 10 ns;
        instruct <= x"00a5c863";  -- blt a1, a0, 16
        wait for 10 ns;
        instruct <= x"fea5d6e3";  -- bge a1, a0, -20
        wait for 10 ns;
        instruct <= x"00a5da63";  -- bge a1, a0, 20
        wait for 10 ns;
        instruct <= x"fe9ff56f";  -- jal a0, -24
        wait for 10 ns;
        instruct <= x"0180056f";  -- jal a0, 24
        wait;
    end process;
    
end Behavioral;
