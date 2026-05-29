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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbenchMemory32bits is
--  Port ( );
end testbenchMemory32bits;

architecture Behavioral of testbenchMemory32bits is
    signal clk, WE : STD_LOGIC := '0';
    signal Addr : STD_LOGIC_VECTOR(31 downto 0);
    signal RD, WD : STD_LOGIC_VECTOR(31 downto 0);
    signal index: integer;
    
    constant size : integer := 16;
    
    component Memory32bits is
    generic (
        size : integer := 8
    );
    Port ( clk : in STD_LOGIC;
           Addr : in STD_LOGIC_VECTOR (31 downto 0);
           WE : in STD_LOGIC;
           WD : in STD_LOGIC_VECTOR (31 downto 0);
           RD : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    
    DUT: Memory32bits
    generic map (
        size => size
    )
    port map (
        clk => clk,
        Addr => Addr,
        WE => WE,
        WD => WD,
        RD => RD
    );
    
    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    
    stimuli_process: process
    begin
        wait for 105 ns;
        Addr<=(others => '0');
        WD <= (others => '1');
        for i in 0 to size-1 loop
            Addr<=std_logic_vector(to_unsigned(4*i, 32));
            wait for 10 ns;
        end loop;
        for i in 0 to size-1 loop
            Addr<=std_logic_vector(to_unsigned(4*i, 32));
            wait for 10 ns;
        end loop;
        WE<='1';
        wait for 10 ns;
        for i in 0 to size-1 loop
            Addr<=std_logic_vector(to_unsigned(4*i, 32));
            WD<=std_logic_vector(to_unsigned(4*i, 32));
            wait for 10 ns;
        end loop;
        WE<='0';
        wait for 10 ns;
        for i in 0 to size-1 loop
            Addr<=std_logic_vector(to_unsigned(4*i, 32));
            wait for 10 ns;
        end loop;
        wait for 10ns;
        Addr<=(others => '1');
        wait;
    end process;
    
    index<=to_integer(shift_right(signed(Addr),2));

end Behavioral;
