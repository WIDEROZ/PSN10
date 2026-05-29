----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 12.05.2025 01:02:28
-- Design Name: 
-- Module Name: testbenchMicrocontrollerRV32bits - Behavioral
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

entity testbenchMicrocontrollerRV32bits is
--  Port ( );
end testbenchMicrocontrollerRV32bits;

architecture Behavioral of testbenchMicrocontrollerRV32bits is
    signal clk : STD_LOGIC := '0';
    signal A, B, C, D, E, F, G : STD_LOGIC;
    signal AN0, AN1, AN2, AN3: STD_LOGIC;
    
    component MicrocontrollerRV32bits is
    Port ( clk : in STD_LOGIC;
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

    microcontroller_rv32 : MicrocontrollerRV32bits
    port map ( 
        clk => clk,
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

    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    
end Behavioral;
