--This module is prepared to combine servo and VGA controls.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity top is
      Port(clk : in std_logic;
           position : in std_logic_vector(2 downto 0);
           gyroY : in std_logic_vector(3 downto 0);
           stall_out : out std_logic;
           servo_r : out std_logic;
           servo_l : out std_logic;
           hSync, vSync: out std_logic;
           vga_r, vga_g, vga_b : out std_logic_vector(3 downto 0); 
           led : out std_logic_vector(3 downto 0)     
      );
end top;

architecture Behavioral of top is

component topModule is
Port ( clk : in STD_LOGIC;
       gyroY : in std_logic_vector(3 downto 0);
       hSync : out STD_LOGIC;
       vSync : out STD_LOGIC;
       vga_r : out STD_LOGIC_vector(3 downto 0);
       vga_g : out STD_LOGIC_vector(3 downto 0);
       vga_b : out STD_LOGIC_vector(3 downto 0));
end component;

component servo360_main is
Port (clk: in std_logic;
      rotation: in std_logic_vector(2 downto 0);
      out_servo: out std_logic);
end component;

component servo360_main_opposite is
Port (clk: in std_logic;
      rotation: in std_logic_vector(2 downto 0);
      out_servo: out std_logic);
end component;


begin

servo_left  : servo360_main Port Map(clk => clk, rotation => position, out_servo => servo_l);
servo_right : servo360_main Port Map(clk => clk, rotation => position, out_servo => servo_r);
vga_module  : topModule Port Map(clk => clk, gyroY => gyroY , vsync => vSync, hsync => hSync, vga_r => vga_r, vga_g => vga_g, vga_b => vga_b );

process(clk) begin
    if rising_edge(clk) then
        if (gyroY > "1110") then
            stall_out <= '0';
        elsif (gyroY < "0010") then
            stall_out <= '0';
        else
            stall_out <= '1';
        end if;
    end if;
end process;

process(clk) begin
    if rising_edge(clk) then
        if gyroY(0) = '1' then
            led(0) <= '1';
        else 
            led(0) <= '0';
        end if;
        if gyroY(1) = '1' then
            led(1) <= '1';
        else 
            led(1) <= '0';
        end if;
        if gyroY(2) = '1' then
            led(2) <= '1';
        else 
            led(2) <= '0';
        end if;
        if gyroY(3) = '1' then
            led(3) <= '1';
        else 
            led(3) <= '0';
        end if;
     end if;
 end process;   

end Behavioral;
