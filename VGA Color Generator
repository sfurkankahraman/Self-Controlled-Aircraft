library ieee;
use ieee.std_logic_1164.all;

entity imageGen is
GENERIC( pixels_y : INTEGER := 400; --row that first color will persist until
         pixels_x : INTEGER := 400); --column that first color will persist until
PORT(   clk : in std_logic;
        gyroY : in std_logic_vector(3 downto 0);
        disp_ena : IN STD_LOGIC;
        row : IN INTEGER;
        column : IN INTEGER;
        VGA_R : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
        VGA_G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
        VGA_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'));
end imageGen;
architecture behavior OF imageGen IS
begin
process(disp_ena, row, column, clk)
begin
if (disp_ena = '1') then
    if (gyroY > "1110" or gyroY < "0010" ) then 
        if (row < pixels_y and column < pixels_x) then
        VGA_R <= (others => '1');
        VGA_G <= (others => '0');
        VGA_B <= (others => '0');
        else
        VGA_R <= (others => '1');
        VGA_G <= (others => '0');
        VGA_B <= (others => '0');
        end if;
        else
        VGA_R <= (others => '0');
        VGA_G <= (others => '0');
        VGA_B <= (others => '0');
        end if;
     elsif (gyroY > "0001" and gyroY < "1111") then 
        if (row < pixels_y and column < pixels_x) then
        VGA_R <= (others => '0');
        VGA_G <= (others => '1');
        VGA_B <= (others => '0');
        else
        VGA_R <= (others => '0');
        VGA_G <= (others => '1');
        VGA_B <= (others => '0');
        end if;
        else
        VGA_R <= (others => '0');
        VGA_G <= (others => '0');
        VGA_B <= (others => '0');
     end if;
end process;
end behavior;
