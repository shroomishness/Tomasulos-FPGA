--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:35 10/09/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/altes.vhd
-- Project Name:  CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY altes IS
END altes;
 
ARCHITECTURE behavior OF altes IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic_vector(5 downto 0);
         clock : IN  std_logic;
         result : OUT  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         ZFlag : OUT  std_logic;
         NFlag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(7 downto 0) := "11110000";
   signal in2 : std_logic_vector(7 downto 0) := "01100101";
   signal SEL : std_logic_vector(5 downto 0) := "010010";
   signal clock : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   signal ZFlag : std_logic;
   signal NFlag : std_logic;

   -- Clock period definitions
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          in1 => in1,
          in2 => in2,
          SEL => SEL,
          clock => clock,
          result => result,
          Cin => Cin,
          Cout => Cout,
          ZFlag => ZFlag,
          NFlag => NFlag
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
