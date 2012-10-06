----------------------------------------------------------------------------------
-- File:				ADD_R (Address Register Bank)
-- Authors: 		Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:   12:27:38 10/11/2011  
-- Module Name:   ADD_R - struct
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: 	None

-- Description: 	These are the address registers. They are always read from and 
--						can be written to when wline is high
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------		ENTITY DECLARATION		---------

entity ADD_R is
    Port ( ADD_in : in  STD_LOGIC_VECTOR (15 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           wline : in  STD_LOGIC;
           ADD_out : out  STD_LOGIC_VECTOR (15 downto 0));
end ADD_R;

architecture struct of ADD_R is


-------		SIGNAL DECLARATIONS		--------

signal a0, a1, a2 : std_logic_vector (15 downto 0);

begin

---------------		CONDITIONAL SIGNALS		--------------

ADD_out <= a0 when SEL = "00" else 
			  a1 when SEL = "01" else
			  a2 when SEL = "10" else "0000000000000000"	;
			
			

-------		WRITE PROCESS		--------

process(wline)
begin
		if wline = '1' THEN
			CASE SEL is
				WHEN "00" => a0 <= ADD_in ;	-- Write to the selected register
				WHEN "01" => a1 <= ADD_in ;
				WHEN "10" => a2 <= ADD_in ;	
				WHEN others => NULL;
			end case;
		end if;
end process;



end struct;

