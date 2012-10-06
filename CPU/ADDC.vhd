----------------------------------------------------------------------------------
-- File:					BIT_AND.vhd (Bitwise and circuit)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	14:49:54 10/08/2011 
-- Module Name:    	ADDC - addwc
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		None

-- Description: 		This is an add with carry. One 8-bit input one signal input (carry in), two 8-bit outputs, 
--							1 signal output (carry out). Triggered by change in inputs.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity ADDC is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cout: out STD_LOGIC);
			  
end ADDC;

architecture addwc of ADDC is

------- 	CONSTANT DECLARATION		-------

constant WIDTH: integer := 8;


------------		SIGNAL DECLARATIONS		-------------

signal INT_CARRY:std_logic_vector (8 downto 0); -- A carry between the 2 bit adders


begin


--------------		DIRECTLY WIRED SIGNALS		-------------------

INT_CARRY(0) <= Cin;					-- First carry is the Carry in
Cout <= INT_CARRY(WIDTH);			-- Last carry signal gets passed out to status register


-----------		CIRCUIT GENERATE		-----------

full_add_gen:


--  Generate 8 2-bit full adders with the carry out of one feeding into the carry in of the next	
for i in 0 to (WIDTH-1) generate
	result(i) <= (in1(i) xor in2(i)) xor INT_CARRY(i);			
	INT_CARRY(i+1) <= (INT_CARRY(i) and (in1(i) xor in2(i))) or (in1(i) and in2(i));
end generate;
	
	
end addwc;
