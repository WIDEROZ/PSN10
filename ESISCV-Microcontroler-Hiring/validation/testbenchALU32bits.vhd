----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 08.05.2025 12:31:17
-- Design Name: 
-- Module Name: testbenchALU32bits - Behavioral
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

entity testbenchALU32bits is
--  Port ( );
end testbenchALU32bits;

architecture Behavioral of testbenchALU32bits is
    signal zero : STD_LOGIC;
    signal mode : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal SrcA, SrcB, output : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    
    component ALU32bits is
    Port ( mode : in STD_LOGIC_VECTOR (2 downto 0);
           SrcA : in STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in STD_LOGIC_VECTOR (31 downto 0);
           zero : out STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    
    DUT: ALU32bits
    port map (
        mode => mode,
        SrcA => SrcA,
        SrcB => SrcB,
        zero => zero,
        output => output
    );
    
    stimuli_process: process
    begin
        wait for 10 ns; -- add
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcB<=(others => '1');
        wait for 10 ns; -- sub
        mode<="UUU"; -- to be completed
        SrcA<=x"00000010";
        SrcB<=x"00000001";
        wait for 10 ns;
        SrcB<=(others => '1');
        wait for 10 ns; -- addi
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcB<=(others => '1');
        wait for 10 ns; -- lw
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcB<=(others => '1');
        wait for 10 ns; -- sw
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcB<=(others => '1');
        wait for 10 ns; -- beq
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcA<=(others => '1');
        SrcB<=(others => '1');
        wait for 10 ns; -- bne
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcA<=(others => '1');
        SrcB<=(others => '1');
        wait for 10 ns; -- blt
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcA<=(others => '1');
        wait for 10 ns; -- bge
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcA<=(others => '1');
        wait for 10 ns; -- jal
        mode<="UUU"; -- to be completed
        SrcA<=x"00000001";
        SrcB<=x"00000000";
        wait for 10 ns;
        SrcA<=(others => '1');
        wait;
    end process;

end Behavioral;
