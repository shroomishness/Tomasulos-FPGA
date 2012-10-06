--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:16:19 10/09/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/BIT_NOT_tb.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BIT_NOT
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
 
ENTITY BIT_NOT_tb IS
END BIT_NOT_tb;
 
ARCHITECTURE behavior OF BIT_NOT_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BIT_NOT
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         result : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal result : std_logic_vector(7 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BIT_NOT PORT MAP (
          in1 => in1,
          in2 => in2,
          result => result
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
