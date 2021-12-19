


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wuerfel is
    Port ( CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end wuerfel;

architecture Behavioral of wuerfel is

signal save_value1:integer range 0 to 5;
signal save_value2:integer range 0 to 5;


begin

process(CLK100MHZ,BTNC,save_value1,save_value2)

variable counter1:integer range 0 to 5;--1.ZAR ÝÇÝN
variable counter2:integer range 0 to 5;--2.ZAR ÝÇÝN

begin

if rising_edge(CLK100MHZ) then --Werte für 1. Würfel
counter1:=counter1+1;
end if;
if rising_edge(CLK100MHZ) then -- Werte für 2. Würfel
counter2:=counter2+1;
end if;

if rising_edge(BTNC) then
save_value1<=counter1;						
end if;
if rising_edge(BTNC) then
save_value2<=counter2;
end if;

case (save_value1) is
when 0=> led(15 downto 9)<="0001000";--1
when 1=> led(15 downto 9)<="0010100"; --2
when 2=> led(15 downto 9)<="0011100" ; --3
when 3=> led(15 downto 9)<="1010101";--4
when 4=> led(15 downto 9)<="1011101";--5
when others=> led(15 downto 9)<="1110111";--6
end case;

case (save_value2) is
when 0=> led(6 downto 0)<="0011100";--1
when 1=> led(6 downto 0)<="0010100";--2
when 2=> led(6 downto 0)<="1110111";--3
when 3=> led(6 downto 0)<="0001000";--4
when 4=> led(6 downto 0)<="1011101";--5
when others=> led(6 downto 0)<="1010101";--6
end case;

end process;
end Behavioral;



