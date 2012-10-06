--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:51 10/11/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/pctb.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC_ctl
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
 
ENTITY pctb IS
END pctb;
 
ARCHITECTURE behavior OF pctb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC_ctl
    PORT(
         PC_ctl_in : IN  std_logic_vector(15 downto 0);
         PC_ctl_out : OUT  std_logic_vector(15 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         acti : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal PC_ctl_in : std_logic_vector(15 downto 0) := "0110011011110001";
   signal op : std_logic_vector(1 downto 0) := "11";
   signal acti : std_logic := '0';

 	--Outputs
   signal PC_ctl_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC_ctl PORT MAP (
          PC_ctl_in => PC_ctl_in,
          PC_ctl_out => PC_ctl_out,
          op => op,
          acti => acti
        );

   -- Clock process definitions
   clock_process :process
   begin
		acti <= '0';		
		wait for clock_period/2;
		acti <= '1';
		op <= "00";
		wait for clock_period/2;
		acti <= '0';	
		wait for clock_period/2;
		acti <= '1';
		op <= "11";
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
