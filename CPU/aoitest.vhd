--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:18:20 10/08/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/aoitest.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aoi
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY aoitest IS
END aoitest;
 
ARCHITECTURE behavior OF aoitest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aoi
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         F : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '1';
   signal C : std_logic := '1';
   signal D : std_logic := '0';

 	--Outputs
   signal F : std_logic;
   -- No clocks detected in port list. Replace A below with 
   -- appropriate port name 
 
   constant A_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aoi PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          F => F
        );

   -- Clock process definitions
   A_process :process
   begin
		A <= '0';
		wait for A_period/2;
		A <= '1';
		wait for A_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for A_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
