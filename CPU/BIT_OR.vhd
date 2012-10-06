----------------------------------------------------------------------------------
-- File:					BIT_OR.vhd (Bitwise or circuit)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	14:49:54 10/08/2011 
-- Module Name:    	BIT_OR - bitor
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		None

-- Description: 		This is a Bit_wise OR. Two 8-bit inputs, one 8-bit output. Triggered by change in inputs
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity BIT_OR is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end BIT_OR;

architecture bitor of BIT_OR is

------- 	CONSTANT DECLARATION		-------

constant WIDTH: integer := 8;

------- ARTHMETIC PROCESS		-------

begin
	process (in1, in2)
	begin
		for i in (WIDTH-1) downto 0 loop
			result(i) <= in1(i) or in2(i);		-- ouput is logic bitwise OR of inputs
		end loop;
	end process;

end bitor;

