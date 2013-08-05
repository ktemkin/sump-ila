--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:50:32 05/18/2010
-- Design Name:   
-- Module Name:   C:/dbdev/My Dropbox/GadgetFactory/Sump_Pump/trunk/VHDL_Core/SPI_tb.vhd
-- Project Name:  Logic_Sniffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Logic_Sniffer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY SPI_tb IS
END SPI_tb;
 
ARCHITECTURE behavior OF SPI_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Logic_Sniffer
    PORT(
         bf_clock : IN  std_logic;
         extClockIn : IN  std_logic;
         extClockOut : OUT  std_logic;
         extTriggerIn : IN  std_logic;
         extTriggerOut : OUT  std_logic;
         input : INOUT  std_logic_vector(31 downto 0);
         miso : OUT  std_logic;
         mosi : IN  std_logic;
         sclk : IN  std_logic;
			cs : in std_logic;
			rx : in std_logic;
			tx : inout std_logic;			
         dataReady : OUT  std_logic;
         armLED : OUT  std_logic;
         triggerLED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal bf_clock : std_logic := '0';
   signal extClockIn : std_logic := '0';
   signal extTriggerIn : std_logic := '0';
   signal mosi : std_logic := '0';
   signal sclk : std_logic := '0';
	signal cs 	: std_logic := '1';
	signal rx 	: std_logic := '1';
	signal tx 	: std_logic := '1';


	--BiDirs
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal extClockOut : std_logic;
   signal extTriggerOut : std_logic;
   signal miso : std_logic;
   signal dataReady : std_logic;
   signal armLED : std_logic;
   signal triggerLED : std_logic;

   -- Clock period definitions
   constant bf_clock_period : time := 100us;
   constant sclk_period : time := 5us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Logic_Sniffer PORT MAP (
          bf_clock => bf_clock,
          extClockIn => extClockIn,
          extClockOut => extClockOut,
          extTriggerIn => extTriggerIn,
          extTriggerOut => extTriggerOut,
          input => input,
          miso => miso,
          mosi => mosi,
          sclk => sclk,
			 cs => cs,
			 rx => rx,
			 tx => tx,
          dataReady => dataReady,
          armLED => armLED,
          triggerLED => triggerLED
        );

   -- Clock process definitions
   bf_clock_process :process
   begin
		bf_clock <= '0';
		wait for bf_clock_period/2;
		bf_clock <= '1';
		wait for bf_clock_period/2;
   end process;
 
--   sclk_process :process
--   begin
--		sclk <= '0';
--		wait for sclk_period/2;
--		sclk <= '1';
--		wait for sclk_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 1ms;	

      wait for bf_clock_period*10;

      -- insert stimulus here 
		input <= (others => '0');
		
		
		-- Start Send 0x02 --
		cs <= '0';
		mosi <= '0';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 500us;
		mosi <= '1';
		wait for 500us;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 500us;
		mosi <= '0';
		wait for 500us;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		cs <= '1';

		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		cs <= '1';
		
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		cs <= '1';
		
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		cs <= '1';
		
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		cs <= '1';
		-- End Send 0x02 --
		
		-- Start Send 0x82 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		mosi <= '1';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		mosi <= '1';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';		
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		cs <= '1';
		-- End Send 0x82 --

		-- Start Send 0xC0 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		mosi <= '1';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		mosi <= '0';
		cs <= '1';			
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		-- End Send 0xC0 --

		-- Start Send 0xC1 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		mosi <= '1';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		mosi <= '1';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		mosi <= '0';
		cs <= '1';		
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		cs <= '1';
		-- End Send 0xC1 --

-- Start Send 0xC2 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		mosi <= '1';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		mosi <= '1';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';		
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
	
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '1';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';				
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		cs <= '1';
		-- End Send 0xC2 --


-- Start Send 0x80 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		mosi <= '1';
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		mosi <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';		
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		cs <= '1';
		-- End Send 0x80 --


		-- Start Send 0x01 --
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '1';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		mosi <= '0';
		wait for 1ms;		
		cs <= '1';
		
		wait for 10ms;
		mosi <= '1';
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';

		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		cs <= '1';
		
		wait for 10ms;
		cs <= '0';
		wait for 10ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;		
		sclk <= '0';
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		sclk <= '1';
		wait for 1ms;
		sclk <= '0';		
		wait for 1ms;
		cs <= '1';
		-- End Send 0x01 --


      wait;
   end process;

END;