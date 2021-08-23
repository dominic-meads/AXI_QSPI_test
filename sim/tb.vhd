----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Dominic Meads
-- 
-- Create Date: 08/22/2021 07:35:12 PM
-- Design Name: 
-- Module Name: tb - sim
-- Project Name: AXI_QSPI
-- Target Devices: 7 Series FPGAs
-- Tool Versions: 2020.1
-- Description: Tests functionality of AXI QSPI in standard mode, with system
--              initialization from AXI Traffic Generator
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

entity tb is
end tb;

architecture sim of tb is

  -- DUT ports
  signal i_reset : STD_LOGIC := '1';
  signal o_spi_rtl_io0_io : STD_LOGIC;  -- MOSI
  signal i_spi_rtl_io1_io : STD_LOGIC;  -- MISO
  signal o_spi_rtl_sck_io : STD_LOGIC;
  signal o_spi_rtl_ss_io : STD_LOGIC_VECTOR ( 0 to 0 );
  signal i_sys_clock : STD_LOGIC := '1';
  
  -- i_clk parameters
  constant clk_hz : integer := 12e6;  -- using the 12 MHz clk on the Arty board
  constant clk_period : time := 1 sec / clk_hz;

begin

  DUT : entity work.AXI_QSPI_top_wrapper(structure)
  port map(
    reset => i_reset,
    spi_rtl_io0_io => o_spi_rtl_io0_io,
    spi_rtl_io1_io => i_spi_rtl_io1_io,
    spi_rtl_sck_io => o_spi_rtl_sck_io,
    spi_rtl_ss_io => o_spi_rtl_ss_io,
    sys_clock => i_sys_clock
    );
    
  CLK_GEN_PROC : process
  begin 
    wait for clk_period / 2;
    i_sys_clock <= not i_sys_clock; 
  end process;
  
  STIM_PROC : process
  begin
     wait for 10 us;
     wait;
  
  end process;


end sim;
