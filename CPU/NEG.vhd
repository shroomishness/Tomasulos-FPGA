----------------------------------------------------------------------------------
-- File:					NEG.vhd (two's complement negation)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	14:49:54 10/08/2011 
-- Module Name:    	NEG - neg
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		None

-- Description: 		This multiplies operand 1 by ( -1 ) using two's complement logic. This is a bitwise
--							NOT followed by adding 1 to the result.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


----------		ENTITY DECLARATION		-----------

entity NEG is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end NEG;

architecture neg of NEG is


------- 	CONSTANT DECLARATION		-------

constant WIDTH: integer := 8;


------------		SIGNAL DECLARATIONS		-------------

signal addnum :std_logic_vector (8 downto 0);		-- The carry for when we add the 1 to the number
signal INT_BUS : std_logic_vector ( 7 downto 0);		-- Internal storage between NOT and add.


begin

--------------		DIRECTLY WIRED SIGNALS		-------------------

addnum(0) <= '1';			-- The one that gets added


------- ARTHMETIC PROCESS		-------

process (in1, in2)
begin
	for i in (WIDTH-1) downto 0 loop
		INT_BUS(i) <= not in1(i);			-- Bitwise NOT the 1st operand
	end loop;
end process;


-----------		CIRCUIT GENERATE		-----------
	
	add_gen:
	for i in 0 to (WIDTH-1) generate
		result(i) <= INT_BUS(i) xor addnum(i);		-- add 1 to the result of the bitwise NOT of operand
		addnum(i+1) <= addnum(i) and INT_BUS(i);
	end generate;
	


end neg;
