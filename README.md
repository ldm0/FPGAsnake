# FPGA snake game

+ Pretty simple snake game for fpga, written in VHDL.
+ This game can be presented use a 1600x900 screen through a VGA port.
+ If other resolution is needed, you are supposed to reference VESA 2008 to get specific vga signal timing specification.

+ PS: Main frequency of this presentation chip of this program is 100mhz.
  But for 1600x900, 108mhz clock is needed, so I use clock wizard IP core
  in Vivado instead of custom clock divider.