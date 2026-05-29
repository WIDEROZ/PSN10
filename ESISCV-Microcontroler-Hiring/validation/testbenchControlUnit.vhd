----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2025 12:31:17
-- Design Name: 
-- Module Name: testbenchMUX2x32bits - Behavioral
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

entity testbenchControlUnit is
--  Port ( );
end testbenchControlUnit;

architecture Behavioral of testbenchControlUnit is
    signal clk : STD_LOGIC := '0';
    signal instruct: STD_LOGIC_VECTOR(31 downto 0);
    signal opcode : STD_LOGIC_VECTOR (6 downto 0);
    signal funct3 : STD_LOGIC_VECTOR (2 downto 0);
    signal  funct7 : STD_LOGIC_VECTOR (6 downto 0);
    signal IoD : STD_LOGIC;
    signal MemWrite : STD_LOGIC;
    signal IRWrite : STD_LOGIC;
    signal MemtoReg : STD_LOGIC;
    signal Link : STD_LOGIC;
    signal Branch : STD_LOGIC;
    signal RegWrite : STD_LOGIC;
    signal ALUSrcB : STD_LOGIC;
    signal ALUControl : STD_LOGIC_VECTOR (2 downto 0);
    signal PCWrite : STD_LOGIC;
    
    component ControlUnit is
    Port ( clk : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (6 downto 0);
           funct3 : in STD_LOGIC_VECTOR (2 downto 0);
           funct7 : in STD_LOGIC_VECTOR (6 downto 0);
           IoD : out STD_LOGIC;
           MemWrite : out STD_LOGIC;
           IRWrite : out STD_LOGIC;
           MemtoReg : out STD_LOGIC;
           Link : out STD_LOGIC;
           Branch : out STD_LOGIC;
           RegWrite : out STD_LOGIC;
           ALUSrcB : out STD_LOGIC;
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0);
           PCWrite : out STD_LOGIC);
    end component;
begin
    
    DUT: ControlUnit
    port map (
        clk => clk,
        opcode => opcode,
        funct3 => funct3,
        funct7 => funct7,
        IoD => IoD,
        MemWrite => MemWrite,
        IRWrite => IRWrite,
        MemtoReg => MemtoReg,
        Link => Link,
        Branch => Branch,
        RegWrite => RegWrite,
        ALUSrcB => ALUSrcB,
        ALUControl => ALUControl,
        PCWrite => PCWrite
    );
    
    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    stimuli_process: process  -- Content of all32.hex
    begin
        wait for 5 ns;
        instruct<=x"00400513";  -- addi a0, zero, 4
        wait for 50 ns;
        instruct<=x"00a50333";  -- add t1, t0, t0
        wait for 50 ns;
        instruct<=x"00a30263";  -- beq t1, a0, 4
        wait for 50 ns;
        instruct<=x"00a51263";  -- bne a0, a0, 4
        wait for 50 ns;
        instruct<=x"00a54263";  -- blt a0, a0, 4
        wait for 50 ns;
        instruct<=x"00655263";  -- bge a0, t1, 4
        wait for 50 ns;
        instruct<=x"004000ef";  -- jal ra, 4
        wait for 50 ns;
        instruct<=x"0040006f";  -- j 4
        wait for 50 ns;
        instruct<=x"01100593";  -- li a1, 17
        wait for 50 ns;
        instruct<=x"00058613";  -- mv a2, a1
        wait for 50 ns;
        instruct<=x"406585b3";  -- sub a1, a2, t1
        wait for 50 ns;
        instruct<=x"fec12e23";  -- sw a2, -4(sp)
        wait for 50 ns;
        instruct<=x"ffc12683";  -- lw a3, -4(sp)
        wait for 50 ns;
        instruct<=x"00000000";
        wait;
    end process;
    
    opcode<=instruct(6 downto 0);
    funct3<=instruct(14 downto 12);
    funct7<=instruct(31 downto 25);
        

end Behavioral;
