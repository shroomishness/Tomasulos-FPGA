--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:28:54 10/08/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/ADD_tb.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD
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
 
ENTITY ADD_tb IS
END ADD_tb;
 
ARCHITECTURE behavior OF ADD_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD
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
 
   constant in1(1)_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          in1 => in1,
          in2 => in2,
          result => result
        );

   -- Clock process definitions
   in1(1)_process :process
   begin
		in1(1) <= '0';
		wait for in1(1)_period/2;
		in1(1) <= '1';
		wait for in1(1)_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for in1(1)_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
