----------------------------------------------------------------------------------
-- core.vhd
--
-- Copyright (C) 2006 Michael Poppitz
-- 
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-- General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
--
----------------------------------------------------------------------------------
--
-- Details: http://www.sump.org/projects/analyzer/
--
-- The core contains all "platform independent" modules and provides a
-- simple interface to those components. The core makes the analyzer
-- memory type and computer interface independent.
--
-- This module also provides a better target for test benches as commands can
-- be sent to the core easily.
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity core is
    GENERIC
	 (
		MEMORY_DEPTH		: integer := 6
    );
    Port ( clock : in  STD_LOGIC;
           extReset : in STD_LOGIC;
           cmd : in  STD_LOGIC_VECTOR (39 downto 0);
           execute : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (31 downto 0);
           inputClock : in  STD_LOGIC;
           sampleReady50 : out  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0);
           outputSend : out  STD_LOGIC;
           outputBusy : in  STD_LOGIC;
           memoryIn : in  STD_LOGIC_VECTOR (31 downto 0);
           memoryOut : out  STD_LOGIC_VECTOR (31 downto 0);
           memoryRead : out  STD_LOGIC;
           memoryWrite : out  STD_LOGIC;
			  extTriggerIn : in  STD_LOGIC;
			  extTriggerOut : out  STD_LOGIC;			  
			  extClockOut : out STD_LOGIC;
			  armLED : out  STD_LOGIC;
			  triggerLED : out  STD_LOGIC;
			  numberScheme : out STD_LOGIC;
			  wrFlags : out std_logic;
			  testMode : out STD_LOGIC			  
			 );
end core;

architecture Behavioral of core is

	COMPONENT decoder
	PORT ( opcode : in  STD_LOGIC_VECTOR (7 downto 0);
			 execute : in std_logic;
			 clock : in std_logic;
          wrtrigmask : out std_logic_vector(3 downto 0);
          wrtrigval : out std_logic_vector(3 downto 0);
			 wrtrigcfg : out std_logic_vector(3 downto 0);
			 wrspeed : out STD_LOGIC;
			 wrsize : out std_logic;
			 wrFlags : out std_logic;
			 arm : out std_logic;
			 --testmode : out STD_LOGIC;
			 reset : out std_logic
		);
	END COMPONENT;

	COMPONENT flags
	PORT(
		data : IN std_logic_vector(10 downto 0);
		clock : IN std_logic;
		write : IN std_logic;          
		demux : OUT std_logic;
	   filter : OUT std_logic;
		external : out std_logic;
		inverted : out std_logic;
		rle : out std_logic;
		numberScheme : out STD_LOGIC;
		testMode : out STD_LOGIC		
	);
	END COMPONENT;
	
	COMPONENT sync is
   PORT (
		input : in  STD_LOGIC_VECTOR (31 downto 0);
		clock : in  STD_LOGIC;
		enableFilter : in  STD_LOGIC;
		enableDemux : in  STD_LOGIC;
		falling : in  STD_LOGIC;
		output : out  STD_LOGIC_VECTOR (31 downto 0)
	);
	END COMPONENT;

	COMPONENT sampler
	PORT(
		input : IN std_logic_vector(31 downto 0);
		clock : IN std_logic;
		exClock : in std_logic;
		external : in std_logic;
		data : IN std_logic_vector(23 downto 0);
		wrDivider : IN std_logic;          
		sample : OUT std_logic_vector(31 downto 0);
		ready : OUT std_logic;
		ready50 : out std_logic
		);
	END COMPONENT;
	
	COMPONENT trigger
	PORT(
		input : IN std_logic_vector(31 downto 0);
	   inputReady : in std_logic;
		data : IN std_logic_vector(31 downto 0);
	   clock : in std_logic;
		reset : in std_logic;
		wrMask : IN std_logic_vector(3 downto 0);
		wrValue : IN std_logic_vector(3 downto 0);
		wrConfig : IN std_logic_vector(3 downto 0);
		arm : IN std_logic;
		demuxed : in std_logic;
      run : out  STD_LOGIC;
		ExtTriggerIn : in STD_LOGIC		
		);
	END COMPONENT;

	COMPONENT controller
	PORT(
		clock : IN std_logic;
		reset : in std_logic;
		input : IN std_logic_vector(31 downto 0);    
	   inputReady : in std_logic;
		data : in std_logic_vector(31 downto 0);
		wrFlags : in std_logic;		
		wrSize : in std_logic;
		run : in std_logic;
		busy : in std_logic;
		send : out std_logic;
		output : out std_logic_vector(31 downto 0);
		memoryIn : in  STD_LOGIC_VECTOR (31 downto 0);
		memoryOut : out  STD_LOGIC_VECTOR (31 downto 0);
		memoryRead : out  STD_LOGIC;
		memoryWrite : out  STD_LOGIC
	);
	END COMPONENT;
	
	COMPONENT rle_enc
	generic (
		MEMORY_DEPTH : integer
	);	
	PORT(
		clock : IN std_logic;
		reset : IN std_logic;
		dataIn : IN std_logic_vector(31 downto 0);
		validIn : IN std_logic;
		enable : IN std_logic;
		dataOut : OUT std_logic_vector(31 downto 0);
		validOut : OUT std_logic
		);
	END COMPONENT;

signal opcode : std_logic_vector (7 downto 0);
signal data, rleOut : std_logic_vector (31 downto 0);
signal sample, syncedInput : std_logic_vector (31 downto 0);
signal sampleClock, run, reset, rleValid, rleEnable : std_logic;
signal wrtrigmask, wrtrigval, wrtrigcfg : std_logic_vector(3 downto 0);
signal wrDivider, wrsize, arm, resetCmd: std_logic;
signal flagDemux, flagFilter, flagExternal, flagInverted, wrFlagsReg, sampleReady: std_logic;
signal armLEDreg : std_logic := '0';
signal triggerLEDreg : std_logic := '0';

begin
	data <= cmd(39 downto 8);
	opcode <= cmd(7 downto 0);
	reset <= extReset or resetCmd;
	armLED <= not armLEDreg; --Logic Sniffers LEDs are connected to 3.3V so a logic 0 turns the LED on.
	triggerLED <= not triggerLEDreg;	
	extClockOut <= sampleClock;
	extTriggerOut <= run;
	wrFlags <= wrFlagsReg;	
	
	--Generates observable trigger and arm LED signals
	process (clock)
	begin
		if rising_edge(clock) then
			if arm = '1' then
				armLEDreg <= '1';
				triggerLEDreg <= '0';
			elsif run = '1' then
				armLEDreg <= '0';
				triggerLEDreg <= '1';
			end if;
		end if;
	end process;
	

	-- select between internal and external sampling clock
   BUFGMUX_intex: BUFGMUX
   port map (
      O => sampleClock,    	-- Clock MUX output
      I0 => clock,  				-- Clock0 input
      I1 => inputClock,			-- Clock1 input
      S => flagExternal     	-- Clock select input
   );
	
	Inst_decoder: decoder PORT MAP(
		opcode => opcode,
		execute => execute,
		clock => clock,
		wrtrigmask => wrtrigmask,
		wrtrigval => wrtrigval,
		wrtrigcfg => wrtrigcfg,
		wrspeed => wrDivider,
		wrsize => wrsize,
		wrFlags => wrFlagsReg,
		arm => arm,
		--testmode => testmode,
		reset => resetCmd
	);

	Inst_flags: flags PORT MAP(
		data => data(10 downto 0),
		clock => clock,
		write => wrFlagsReg,
		demux => flagDemux,
		filter => flagFilter,
		external => flagExternal,
		inverted => flagInverted,
		rle => rleEnable,
		numberScheme => numberScheme,
		testMode => testMode
	);
	
	Inst_sync: sync PORT MAP(
		input => input,
		clock => sampleClock,
    enableFilter => '0', --Disabled due to timing constraints on the Papilio.
		enableDemux => flagDemux, 
		falling => '0', -- Disabled due to timing constraints on the Papilio.
		output => syncedInput
	);

	Inst_sampler: sampler PORT MAP(
		input => syncedInput,
		clock => clock,
		exClock => inputClock,	-- use sampleClock?
		external => flagExternal,
		data => data(23 downto 0),
		wrDivider => wrDivider,
		sample => sample,
		ready => sampleReady,
		ready50 => sampleReady50
	);
	
	Inst_trigger: trigger PORT MAP(
		input => sample,
		inputReady => sampleReady,
		data => data,
		clock => clock,
		reset => reset,
		wrMask => wrtrigmask,
		wrValue => wrtrigval,
		wrConfig => wrtrigcfg,
		arm => arm,
		demuxed => flagDemux,
		run => run,
		extTriggerIn => extTriggerIn
	);

	Inst_controller: controller PORT MAP(
		clock => clock,
		reset => reset,
		input => rleOut,
		inputReady => rleValid,
		data => data,
		wrFlags => wrFlagsReg,		
		wrSize => wrsize,
		run => run,
		busy => outputBusy,
		send => outputSend,
		output => output,
		memoryIn => memoryIn,
		memoryOut => memoryOut,
		memoryRead => memoryRead,
		memoryWrite => memoryWrite
	);
	
	Inst_rle_enc: rle_enc 
	GENERIC MAP (
		MEMORY_DEPTH => MEMORY_DEPTH
	)
	PORT MAP(
		clock => clock,
		reset => reset,
		dataIn => sample,
		validIn => sampleReady,
		enable => rleEnable,
		dataOut => rleOut,
		validOut => rleValid
	);

end Behavioral;

