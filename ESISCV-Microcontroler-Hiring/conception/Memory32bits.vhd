----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2025 13:32:54
-- Design Name: 
-- Module Name: Memory32bits - Behavioral
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

entity Memory32bits is
    generic (
        size : integer := 16
    );
    Port ( clk : in STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           RD : out STD_LOGIC_VECTOR (31 downto 0));
end Memory32bits;

architecture Behavioral of Memory32bits is
    type memoryRAM is array(0 to size-1) of std_logic_vector(31 downto 0);
    signal memory : memoryRAM := (  -- Content of sumInt.hex
        x"00a00293", -- addi t0, zero, 10
        x"00100313", -- li t1, 1
        x"00000393", -- li t2, 0
        x"00535863", -- bge t1, t0, 16
        x"006383b3", -- add t2, t2, t1
        x"00130313", -- addi t1, t1, 1
        x"ff5ff06f", -- j -12
        x"10000293", -- li t0, 256
        x"0072a023", -- sw t2, 0(t0)
        others=>(others=>'0'));
begin

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
