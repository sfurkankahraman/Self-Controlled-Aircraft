library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clockDivider is

Port  ( clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        clockOut : out STD_LOGIC);
end clockDivider;

architecture Behavioral of clockDivider is

signal clock25 : STD_LOGIC_VECTOR(1 downto 0);

begin

process(clk, reset)

begin

if(reset = '1') then
    clock25 <= (others => '0');
elsif(rising_edge(clk)) then
    clock25 <= clock25 + 1;
end if;
end process;

clockOut <= clock25(1);

end Behavioral;
