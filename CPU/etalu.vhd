--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:25 10/09/2011
-- Design Name:   
-- Module Name:   J:/353/CPU/etalu.vhd
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
 
ENTITY etalu IS
END etalu;
 
ARCHITECTURE behavior OF etalu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         in1 : IN  std_logic_vector(7 downto 0);
         in2 : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic_vector(5 downto 0);
         result : OUT  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         ZFlag : OUT  std_logic;
         NFlag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(7 downto 0) := "11110000";
   signal in2 : std_logic_vector(7 downto 0) := "10100101";
   signal SEL : std_logic_vector(5 downto 0) := "011110";
   signal Cin : std_logic := '1';

 	--Outputs
   signal result : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   signal ZFlag : std_logic;
   signal NFlag : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          in1 => in1,
          in2 => in2,
          SEL => SEL,
          result => result,
          Cin => Cin,
          Cout => Cout,
          ZFlag => ZFlag,
          NFlag => NFlag
        );

   -- Clock process definitions
   clock_process :process
   begin
		SEL <= "010110";
		wait for clock_period/2;
		in1 <= "10011001";
		in2 <= "11010001";
		wait for clock_period/2;
		SEL <= "000010";
		in1 <= "10110001";
		wait for clock_period/2;
		in1 <= "10011111";
		
		in2 <= "00000101";
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
