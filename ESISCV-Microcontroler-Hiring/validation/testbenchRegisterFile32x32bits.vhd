----------------------------------------------------------------------------------
-- Company: ESISCV
-- Engineer: Louis Morge-Rollet
-- 
-- Create Date: 08.05.2025 12:31:17
-- Design Name: 
-- Module Name: testbenchRegister32x32bits - Behavioral
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

entity testbenchRegister32x32bits is
--  Port ( );
end testbenchRegister32x32bits;

architecture Behavioral of testbenchRegister32x32bits is
    signal clk, WE3 : STD_LOGIC := '0';
    signal Addr1, Addr2, Addr3 : STD_LOGIC_VECTOR(4 downto 0);
    signal RD1, RD2, WD3 : STD_LOGIC_VECTOR(31 downto 0);
    
    component RegisterFile32x32bits is
    Port ( clk : in STD_LOGIC;
           Addr1 : in STD_LOGIC_VECTOR (4 downto 0);
           Addr2 : in STD_LOGIC_VECTOR (4 downto 0);
           Addr3 : in STD_LOGIC_VECTOR (4 downto 0);
           WE3 : in STD_LOGIC;
           WD3 : in STD_LOGIC_VECTOR (31 downto 0);
           RD1 : out STD_LOGIC_VECTOR (31 downto 0);
           RD2 : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
begin
    
    DUT: RegisterFile32x32bits
    port map (
        clk => clk,
        Addr1 => Addr1,
        Addr2 => Addr2,
        Addr3 => Addr3,
        WE3 => WE3,
        WD3 => WD3,
        RD1 => RD1,
        RD2 => RD2
    );
    
    clock_process: process
    begin
        wait for 5 ns;
        clk <= not clk;
    end process;
    
    stimuli_process: process
    begin
        wait for 100 ms;
        for i in 0 to 31 loop
            Addr1<=std_logic_vector(to_unsigned(i, 32));
            wait for 10 ns;
        end loop;
        WE3<='1';
        wait for 10 ns;
        for i in 0 to 31 loop
            Addr3<=std_logic_vector(to_unsigned(i, 32));
            WD3<=std_logic_vector(to_unsigned(i, 32));
            wait for 10 ns;
        end loop;
        WE3<='0';
        wait for 10 ns;
        for i in 0 to 31 loop
            Addr2<=std_logic_vector(to_unsigned(i, 32));
            wait for 10 ns;
        end loop;
        Addr3<=(others => '0');
        WE3<='1';
        wait for 10 ns;
        WD3<=(others => '1');
        wait for 10 ns;
        Addr1<=(others => '0');
        wait;
    end process;
        

end Behavioral;
