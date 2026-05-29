----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2026 09:23:42
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port ( clk : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (6 downto 0);
           funct3 : in STD_LOGIC_VECTOR (2 downto 0);
           funct7 : in STD_LOGIC_VECTOR (6 downto 0);
           IoD : out STD_LOGIC := '0';
           MemWrite : out STD_LOGIC := '0';
           IRWrite : out STD_LOGIC := '0';
           MemtoReg : out STD_LOGIC := '0';
           Link : out STD_LOGIC := '0';
           Branch : out STD_LOGIC := '0';
           RegWrite : out STD_LOGIC := '0';
           ALUSrcB : out STD_LOGIC := '0';
           ALUControl : out STD_LOGIC_VECTOR (2 downto 0):=(others => '0');
           PCWrite : out STD_LOGIC := '0');
end ControlUnit;

architecture Behavioral of ControlUnit is
    type etat is (fetch, decode, execute, mem_access, write_back);
    type operation is (add, sub, addi, lw, sw, beq, bne, blt, bge, jal);
    signal state : etat := write_back;
    signal op : operation;
begin

    process(clk)
    begin
        if clk'event and clk='1' then
            case state is
                when fetch =>
                    state<= decode;
                when decode =>
                    state<= execute;
                when execute =>
                    state<= mem_access;
                when mem_access =>
                    state<= write_back;
                when write_back =>
                    state<= fetch;
            end case;
        end if;
    
    end process;
    
    process(state, op, opcode, funct3, funct7)
    begin
        IRWrite <= '0';
        IoD <= '0';
        MemWrite <= '0';
        PCWrite <= '0';
        ALUControl <= "000";
        ALUSrcB <= '0';
        RegWrite <= '0';
        Branch <= '0';
        Link <= '0';
        MemtoReg <= '0';
        case state is
           when fetch =>
           IRWrite <= '1';

           when decode =>
                case opcode is
                    when "0110011" =>--add or sub
                        case funct7 is
                            when "0000000" => --add
                                op <= add;
                            when "0100000" => --sub
                                op <= sub;
                            when others => null;
                            end case;
                    when "0010011" => --addi
                        op <= addi;
                    when "0000011" => --lw
                        op <= lw;
                    when "0100011" => --sw
                        op <= sw;
                    when "1100011" => --branch
                        case funct3 is
                            when "000" => --beq
                                op <= beq;
                            when "001" => --bne
                                op <= bne;
                            when "100" => --blt
                                op <= blt;
                            when "101" => --bge
                                op <= bge;
                            when others => null;
                            end case;
                    when "1101111" => --jal
                        op <= jal;
                    when others => null;
                    end case;
           when execute =>
                case op is
                    when add =>
                        ALUControl <= "001";
                    when sub =>
                        ALUControl <= "010";
                    when addi =>
                        ALUControl <= "001";
                        AlUSrcB <= '1';
                    when lw =>
                        ALUControl <= "001";
                        AlUSrcB <= '1';
                    when sw =>
                        ALUControl <= "001";
                        AlUSrcB <= '1';
                    when beq =>
                        ALUControl <= "011";
                        Branch <= '1';
                    when bne =>
                        ALUControl <= "100";
                        Branch <= '1';
                    when blt =>
                        ALUControl <= "101";
                        Branch <= '1';
                    when bge =>
                        ALUControl <= "110";
                        Branch <= '1';
                    when jal =>
                        Link <= '1';
                    when others => null;
                    end case;
           when mem_access =>
                case op is
                    when lw =>
                        IoD <= '1';
                        MemtoReg <= '1';
                    when sw =>
                        IoD <= '1';
                        MemtoReg <= '1';
                    when others => null;
                    end case;
           when write_back =>
            case op is
                when add =>
                    RegWrite <= '1';
                when sub =>
                    RegWrite <= '1';
                when addi =>
                    RegWrite <= '1';
                when lw =>
                    RegWrite <= '1';
                when jal =>
                    RegWrite <= '1';
                when others => null;
                end case;
            end case;
    end process;

end Behavioral;
