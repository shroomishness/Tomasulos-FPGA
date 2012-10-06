--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:26 10/08/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/addtb.vhd
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
 
ENTITY addtb IS
END addtb;
 
ARCHITECTURE behavior OF addtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         clock : IN  std_logic;
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(7 downto 0) := (others => '0');
   signal in2 : std_logic_vector(7 downto 0) := (others => '0');
   signal clock : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD PORT MAP (
          in1 => in1,
          in2 => in2,
          clock => clock,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
