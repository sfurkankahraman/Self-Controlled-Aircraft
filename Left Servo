library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity servo360_main is
Port (clk: in std_logic;
      rotation: in std_logic_vector(2 downto 0);
      out_servo: out std_logic);
end servo360_main;

architecture Behavioral of servo360_main is

signal pwmcounter: integer:=0;

begin

process(rotation,clk,pwmcounter) begin
if rising_edge(clk) then
pwmcounter<=pwmcounter+1;  
    
    if rotation="000" then 
         
        if pwmcounter<100000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
        
    elsif rotation ="001" then
    
        if pwmcounter<115000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
   
    elsif rotation ="010" then
    
        if pwmcounter<130000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
    
    elsif rotation ="011" then
    
        if pwmcounter<145000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
    
    elsif rotation ="100" then
    
        if pwmcounter<160000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
    
    elsif rotation ="101" then
    
        if pwmcounter<175000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;
    
    elsif rotation ="110" then
    
        if pwmcounter<190000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if;   
   
    elsif  rotation ="111" then 
      
        if pwmcounter<200000 then
            out_servo<='1';
        elsif pwmcounter<2000000 then
            out_servo<='0';
        else 
            pwmcounter<=0;
        end if; 
    end if;
    
end if;   
end process;
     
end Behavioral;
