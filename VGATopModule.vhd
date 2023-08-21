library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity topModule is
Port ( clk : in STD_LOGIC;
       stall : in std_logic;
       gyroY : in std_logic_vector(3 downto 0);
       hSync : out STD_LOGIC;
       vSync : out STD_LOGIC;
       vga_r : out STD_LOGIC_vector(3 downto 0);
       vga_g : out STD_LOGIC_vector(3 downto 0);
       vga_b : out STD_LOGIC_vector(3 downto 0));
end topModule;

architecture Behavioral of topModule is

component VGA
PORT(   clk : IN std_logic;
        hSync : OUT std_logic;
        vSync : OUT std_logic;
        displayEn : OUT std_logic;
        row: out INTEGER;
        column: out INTEGER);
end component;

component clockDivider
Port (  clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        clockOut : out STD_LOGIC);
end component;

component imageGen
            Port(   clk : in std_logic;
                    gyroY : in std_logic_vector(3 downto 0);
                    disp_ena : IN STD_LOGIC;
                    row : IN INTEGER;
                    column : IN INTEGER;
                    VGA_R : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
                    VGA_G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
                    VGA_B : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0'));
end component;

signal row: INTEGER;
signal column: INTEGER;
signal tClock : STD_LOGIC;
signal reset: STD_LOGIC;
signal displayEn : std_logic;

begin

S1: clockDivider PORT MAP (clk, reset, tClock);
S2: VGA PORT MAP( tClock, hSync, vSync, displayEn, row, column);
S3: imageGen PORT MAP (clk, gyroY, displayEn, row, column, VGA_R, VGA_G, VGA_B);
end Behavioral;
