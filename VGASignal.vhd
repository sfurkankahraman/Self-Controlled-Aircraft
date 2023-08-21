library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VGA is

Port (  clk : in STD_LOGIC;
        hSync : out STD_LOGIC;
        vSync : out STD_LOGIC;
        displayEn : out STD_LOGIC;
        row: out INTEGER;
        column: out INTEGER);
end VGA;

architecture Behavioral of VGA is

signal Hcnt: STD_LOGIC_VECTOR(9 downto 0):="0000000000";
signal Vcnt: STD_LOGIC_VECTOR(9 downto 0):="1000001000";

constant HM: integer :=800;
constant HD: integer :=640;
constant HF: integer :=16;  -- horizontal wait time 
constant HB: integer :=48;  -- horizontal wait time
constant HR: integer :=96;  -- horizontal wait time

constant VM: integer :=525;     
constant VD: integer :=480; 
constant VF: integer :=10;  -- vertical wait time
constant VB: integer :=33;  -- vertical wait time
constant VR: integer :=2;   -- vertical wait time
begin

process(clk)

begin

if (clk'event and clk='1') then
    if (Hcnt = HM-1) then
        Hcnt <= "0000000000";

        if (Vcnt= VM-1) then
            Vcnt <= "0000000000";
            displayEn <= '1';
        else
            if vCnt < VD-1 then
                displayEn <= '1';
            end if;
            Vcnt <= Vcnt+1;
        end if;
        else
            if Hcnt = HD-1 then
            displayEn <= '0';
            end if;
            Hcnt <= Hcnt + 1;
        end if;
    end if;
end process;


process(clk)
begin
    if (clk'event and clk='1') then
        if (Hcnt >= (HD+HF) and Hcnt <= (HD+HF+HR-1)) then
            hSync <= '0';
        else
            hSync <= '1';
        end if;
    end if;
end process;

process(clk)
begin
if (clk'event and clk='1') then
if (Vcnt >= (VD+VF) and Vcnt <= (VD+VF+VR-1)) then ---Vcnt >= 490 and vcnt<= 491
vSync <= '0';
else

vSync <= '1';


end if;
end if;
end process;
row <= conv_integer( unsigned(Hcnt));
column <= conv_integer( unsigned(Vcnt));
end Behavioral;
