----------------------------------------------------------------------------------
-- File:					ALU.vhd (Arithmetic Logic Unit Module)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	19:23:49 10/08/2011  
-- Module Name:    	ALU - Behavioral 
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		BIT_AND.vhd, BIT_OR.vhd, BIT_NOT.vhd, BIT_XOR.vhd, ADDC.vhd, SBB.vhd, NEG.vhd

-- Description: 		This is a control module for Arithmetic operations. 
--							It is not triggered by any edges, but is hardwired into its inputs.
--	Additional:			The add with carry circuit (ADC) is used for the add commmand (ADD). 
--							The subtract with borrow circuit (SBB) is used for the subtract command (SUB)
--							and for the compare commmand (CMP), to save on circuitry.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity ALU is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  SEL : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ZFlag : out  STD_LOGIC;
           NFlag : out  STD_LOGIC);
end ALU;


architecture Behavioral of ALU is


----------  	MODULE INCLUDE DECLARATIONS	  -----------

component ADDC is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cout: out STD_LOGIC);
			  
end component;

component BIT_NOT is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end component;

component BIT_OR is
     Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end component;

component BIT_XOR is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end component;



component NEG is
     Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end component;

component SBB is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cout, NFlag, ZFlag : out STD_LOGIC);
			  
end component;


component BIT_AND is
     Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end component;


------------		SIGNAL DECLARATIONS		-------------

signal AND_R: STD_LOGIC_VECTOR (7 downto 0);
signal OR_R : STD_LOGIC_VECTOR (7 downto 0);
signal NOT_R: STD_LOGIC_VECTOR (7 downto 0);
signal XOR_R: STD_LOGIC_VECTOR (7 downto 0);
signal ADC_R: STD_LOGIC_VECTOR (7 downto 0);
signal ADC_Cout: STD_LOGIC;
signal SBB_R: STD_LOGIC_VECTOR (7 downto 0);
signal SBB_Cout, SBB_Z, SBB_N: STD_LOGIC;
signal NEG_R: STD_LOGIC_VECTOR (7 downto 0);

begin

--------------		MODULE INSTANCES		---------------

-- Bitwise AND instance.
ALU_AND: BIT_AND port map (in1, in2, AND_R);
-- Bitwise OR instance
ALU_OR : BIT_OR  port map (in1, in2, OR_R);
-- Bitwise NOT instance
ALU_NOT: BIT_NOT port map (in1, in2, NOT_R);
-- Bitwise XOR instance
ALU_XOR: BIT_XOR port map (in1, in2, XOR_R);

-- Add with Carry instance.
ALU_ADC: ADDC	  port map (in1, in2, Cin, ADC_R, ADC_Cout);
-- Subtract with Borrow instance
ALU_SBB: SBB	  port map (in1, in2, Cin, SBB_R, SBB_Cout, SBB_N, SBB_Z);
-- Negate (two's complement) instance.
ALU_NEG: NEG	  port map (in1, in2, NEG_R);


---------------		CONDITIONAL SIGNALS		--------------

		result  <=  AND_R when SEL = "000010" else		-- AND
					   OR_R  when SEL = "000110" else		-- OR
						NOT_R when SEL = "001010" else		-- NOT
						XOR_R when SEL = "001110" else		-- XOR
						ADC_R when SEL = "010010" else		-- ADD
						ADC_R when SEL = "010110" else		-- ADC
						SBB_R when SEL = "011010" else		-- SUB
						SBB_R when SEL = "011110" else		-- SBB
						SBB_R when SEL = "001100" else		-- CMP
						NEG_R when SEL = "001000" else 		-- NEG
						"00000000";
						
		Cout <= 		ADC_Cout when SEL = "010010" else		-- ADC
						SBB_Cout when SEL = "011110" else 		-- SBB
						'0';
						
		NFlag <= 	SBB_N when SEL = "001100" else '0';		-- CMP

		ZFlag <=		SBB_Z when SEL = "001100" else '0';		-- CMP
					
			
	
end Behavioral;

