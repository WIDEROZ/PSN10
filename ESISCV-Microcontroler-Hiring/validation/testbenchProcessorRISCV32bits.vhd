----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2025 00:31:23
-- Design Name: 
-- Module Name: testbenchProcessorRISCV32bits - Behavioral
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

entity testbenchProcessorRISCV32bits is
--  Port ( );
end testbenchProcessorRISCV32bits;

architecture Behavioral of testbenchProcessorRISCV32bits is
    constant size : integer := 16;
    signal clk : STD_LOGIC := '0';
    signal WE : STD_LOGIC;
    signal Addr: STD_LOGIC_VECTOR(31 downto 0);
    signal RD: STD_LOGIC_VECTOR(31 downto 0);
    signal WD: STD_LOGIC_VECTOR(31 downto 0);
    type memoryRAM is array(0 to size-1) of std_logic_vector(31 downto 0);
    signal memory : memoryRAM := (  -- Content of all32.hex
        x"04000113", -- li sp, 64
        x"00400513", -- addi    a0, zero, 4
        x"00a50333", -- add     t1, a0, a0
        x"00a30263", -- beq     t1, a0, 4
        x"00a51263", -- bne     a0, a0, 4
        x"00a54263", -- blt     a0, a0, 4
        x"00655263", -- bge     a0, t1, 4
        x"004000ef", -- jal     ra, 4
        x"0040006f", -- j       4
        x"01100593", -- li      a1, 17
        x"00058613", -- mv      a2, a1
        x"406585b3", -- sub     a1, a1, t1
        x"fec12e23", -- sw      a2, -4(sp)
        x"ffc12683", -- lw      a3, -4(sp)
        others=>(others=>'0'));
    
    component ProcessorRISCV32bits is
    Port ( clk : in STD_LOGIC;
           RD : in STD_LOGIC_VECTOR (31 downto 0);
           WE : out STD_LOGIC;
           Addr : out STD_LOGIC_VECTOR (31 downto 0);
           WD : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    processor_rv32 : ProcessorRISCV32bits
    port map (
        clk => clk,
        RD => RD,
        WE => WE,
        Addr => Addr,
        WD => WD
    );
    
    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;

    write_process: process(clk)
    begin
        if clk'event and clk='1' then
            if WE = '1' and unsigned(Addr) < to_unsigned(4*size, 32) then
                memory(to_integer(shift_right(signed(Addr),2))) <= WD;
            end if;
        end if;
    end process;
    
    read_process: process(Addr)
    begin
        if unsigned(Addr) < to_unsigned(4*size, 32) then
            RD <= memory(to_integer(shift_right(signed(Addr),2)));
        else
            RD <= (others => '0');
        end if;
    end process;

end Behavioral;
