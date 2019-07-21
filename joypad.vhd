library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity joypad is
    port(
        clk_60hz    : in std_logic;
        button      : in std_logic_vector(4 downto 0);
        stop        : out std_logic;
        direction   : out std_logic_vector(1 downto 0));
end entity;

architecture main of joypad is
begin
    process(clk_60hz)
        --button in "up right down left stop" direction
        variable old_button : std_logic_vector(4 downto 0) := (others => '0');
        variable stop_next : std_logic := '0';
        variable direction_next : std_logic_vector(1 downto 0) := (others => '0');
    begin
        if (rising_edge(clk_60hz)) then
            if (old_button(0) = '0' and button(0) = '1') then
                direction_next := "00"; --up
            end if;
            if (old_button(1) = '0' and button(1) = '1') then
                direction_next := "01"; --right
            end if;
            if (old_button(2) = '0' and button(2) = '1') then
                direction_next := "10"; --down
            end if;
            if (old_button(3) = '0' and button(3) = '1') then
                direction_next := "11"; --left
            end if;
            if (old_button(4) = '0' and button(4) = '1') then
                stop_next := not stop_next;     --stop
            end if;
            old_button := button;
        end if;
        stop <= stop_next;
        direction <= direction_next;
    end process;
end architecture;

