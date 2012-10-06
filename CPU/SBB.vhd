-------------------------------------------------------------------------------------------------------------------------------
-- File:					SBB.vhd  (subtraction with borrow)																 --
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank																 --
-- 																															 --
-- Create Date:    	14:49:54 10/08/2011 																					 --
-- Module Name:    	SBB - sbb																								 --
-- Project Name: 		ENEL 353 Digital Logic Project																		 --
-- Dependencies: 		None																								 --
--																															 --
-- Description: 		This is a subtract with borrow. It has 3 inputs:													 --
--							Carry in (borrow), and the two operands (8-bit). It has 4 outputs:								 --
--							Carry out (borrow), Zero Flag, Negative Flag, and the result (8-bit)							 --
--							It performs two's comlement negation on the second operand, then adds the two operands together. --
-------------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity SBB is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cout, NFlag, ZFlag : out STD_LOGIC);
			  
end SBB;

architecture sbb of SBB is

------- 	CONSTANT DECLARATION		-------

constant WIDTH: integer := 8;


------------		SIGNAL DECLARATIONS		-------------

signal INT_CARRY1, INT_CARRY2:std_logic_vector (8 downto 0); -- First carry to add 1 to complement operand
																				 -- Second carry to add new neg number to 1st op
signal INT_BUS1, INT_BUS2, INT_BUS3: std_logic_vector (7 downto 0);	-- Internal Buses to store values
																							-- arithmetic stages
begin
	
	
--------------		DIRECTLY WIRED SIGNALS		-------------------
	
		INT_CARRY1(0) <= '1';				-- This is the number we add after two's complement
		Cout <= INT_CARRY2(WIDTH);			-- Last carry signal gets passed out to status register	
		INT_CARRY2(0) <= Cin;				-- First carry of second carry bus is the Carry in
		

---------------		CONDITIONAL SIGNALS		--------------		
		
		NFlag <= '1' when INT_BUS3(WIDTH-1) = '1' else 	--	if the first bit is zero, set the negative flag
					'0';
		ZFlag <= '0' when INT_BUS3(WIDTH-1) = '1' else	-- if the result is negative, it isn't zero
					'1' when INT_BUS3 = "00000000" else 	-- If the result is zero, return a '1' in the zero flag
					'0';
		
		
-----------		OPERAND PROCESS	--------
		
		process (in1, in2)
			begin
			for i in (WIDTH-1) downto 0 loop
				INT_BUS1(i) <= not in2(i);			-- First part of Negation, bitwise NOT the second operand
			end loop;
		end process;
		
		
-------		CIRCUIT GENERATES		---------
		
		add_gen:
		for i in 0 to (WIDTH-1) generate
			INT_BUS2(i) <= INT_BUS1(i) xor INT_CARRY1(i);	-- Add 1 to the value 
			INT_CARRY1(i+1) <= INT_CARRY1(i) and INT_BUS1(i);
		end generate;
		
		
		sub_gen:
		for i in 0 to (WIDTH-1) generate
			INT_BUS3(i) <= (in1(i) xor INT_BUS2(i)) xor INT_CARRY2(i);
			result(i) <= (in1(i) xor INT_BUS2(i)) xor INT_CARRY2(i);			-- Adder circuit to get result
			INT_CARRY2(i+1) <= (INT_CARRY2(i) and (in1(i) xor INT_BUS2(i))) or (in1(i) and INT_BUS2(i));
		end generate;
		
			
			
		
end sbb;
