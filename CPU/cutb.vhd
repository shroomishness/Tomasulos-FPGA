----------------------------------------------------------------------------------
-- File:				cutb.vhd (Control Unit Test Module)
-- Authors: 		Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:   17:19:48 10/11/2011
-- Module Name:   cutb
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: 	None

-- Description: 	This is a testbench for the whole CPU. It updates the opcode every clock falling edge.
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY cutb IS
END cutb;
 
ARCHITECTURE behavior OF cutb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         ins_data : IN  std_logic_vector(15 downto 0);
         ins_addr : OUT  std_logic_vector(15 downto 0);
         ins_req : OUT  std_logic;
         ins_ack : IN  std_logic;
         clock : IN  std_logic;
         dat_addr : OUT  std_logic_vector(15 downto 0);
         dat_data : INOUT  std_logic_vector(7 downto 0);
         dat_read : OUT  std_logic;
         dat_req : OUT  std_logic;
         dat_ack : IN  std_logic;
			test : out  STD_LOGIC_VECTOR (7 downto 0);
			regout1 : out  STD_LOGIC_VECTOR (7 downto 0);
			alout : out  STD_LOGIC_VECTOR (7 downto 0);
			regout2 : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
    END COMPONENT;
    

   --Inputs
   signal ins_data : std_logic_vector(15 downto 0) := "1000011111010100";
   signal ins_ack : std_logic := '0';
   signal clock : std_logic := '0';
   signal dat_ack : std_logic := '0';

	--BiDirs
   signal dat_data : std_logic_vector(7 downto 0);

 	--Outputs
   signal ins_addr : std_logic_vector(15 downto 0);
   signal ins_req : std_logic;
   signal dat_addr : std_logic_vector(15 downto 0);
   signal dat_read : std_logic;
   signal dat_req : std_logic;
	signal test: std_logic_vector(7 downto 0);
	signal regout1: std_logic_vector(7 downto 0);
	signal regout2: std_logic_vector(7 downto 0);
	signal alout: std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          ins_data => ins_data,
          ins_addr => ins_addr,
          ins_req => ins_req,
          ins_ack => ins_ack,
          clock => clock,
          dat_addr => dat_addr,
          dat_data => dat_data,
          dat_read => dat_read,
          dat_req => dat_req,
          dat_ack => dat_ack,
			 test => test,
			 regout1 => regout1,
			 regout2 => regout2,
			 alout => alout
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		ins_data <= "1000011111010100"; -- load reg 0 with 1111 0101
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1000011111010100"; -- load reg 0 with 1111 0101
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1000011010101001"; -- load reg 1 with 10101010
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		
		--ins_data <= "00101000000000001"; -- not reg 0 (00001010)
		ins_data <= "0011100000000001"; -- xor reg 0 and reg 1 (10100000)
		--ins_data <= "00001000000000001"; -- and reg 0 and reg 1  (10110000)
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1000011011100001"; -- load reg 1 with 10111000
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		--ins_data <= "00101000000000001"; -- not reg 0 (00001010)
		--ins_data <= "00111000000000001"; -- xor reg 0 and reg 1 (10100000)
		ins_data <= "0000100000000001"; -- and reg 0 and reg 1  (10110000)
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "0001000100100001"; -- load addr_reg 1 (high) with reg 1
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "0001000000100000"; -- load addr_reg 1 (low) with reg 0
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "0111110000100000" ;  -- PC with addr_reg1 
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1111110001001001" ;  -- load reg2 with addr_reg1 (high)
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1111110001100001" ;  -- load reg3 with addr_reg1 (low)
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		ins_data <= "0011100001000011"; -- xor reg 2 and reg 3 (10100000)
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "1110110000101100" ;  -- PC + 00001011 
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		ins_data <= "0001010000100010" ;  -- data_line is reg2
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
