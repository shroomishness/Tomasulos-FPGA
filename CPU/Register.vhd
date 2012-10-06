----------------------------------------------------------------------------------
-- File:					Register.vhd (General Purpose Register Bank)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	21:19:21 10/10/2011  
-- Module Name:    	Register - Behavioral
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		None

-- Description: 		This contains the General Purpose Registers. 
--							It has two bus outputs, one bus input, two select lines, and a write line.
--							The write select line is the same as the first output select line.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity Reg is
	
	PORT( wline 	: in std_logic;
			SEL1,SEL2: in std_logic_vector (2 downto 0);
			data_in	: in std_logic_vector (7 downto 0);
			data_out1: out std_logic_vector (7 downto 0);
			data_out2: out std_logic_vector (7 downto 0));
end Reg;

architecture Behavioral of Reg is

-------		SIGNAL DECLARATIONS		--------

signal r0, r1, r2, r3, r4, r5, r6, r7 : std_logic_vector (7 downto 0); -- Our 8 registers

begin

---------------		CONDITIONAL SIGNALS		--------------

	data_out1 <=  r0 when SEL1 = "000" else 					-- data_out1 is mapped to one of the registers
					  r1 when SEL1 = "001" else
					  r2 when SEL1 = "010" else 
					  r3 when SEL1 = "011" else 
					  r4 when SEL1 = "100" else
					  r5 when SEL1 = "001" else
					  r6 when SEL1 = "010" else
					  r7 when SEL1 = "011" else "00000000"	;
					  
	data_out2 <=  r0 when SEL2 = "000" else 					-- data_out2 is mapped to one of the registers
					  r1 when SEL2 = "001" else
					  r2 when SEL2 = "010" else 
					  r3 when SEL2 = "011" else 
					  r4 when SEL2 = "100" else
					  r5 when SEL2 = "001" else
					  r6 when SEL2 = "010" else
					  r7 when SEL2 = "011" else "00000000"	;	
					  
			
-------		WRITE PROCESS		--------

process(wline)
begin
		if wline = '1' THEN
			CASE SEL1 is
				WHEN "000" => r0 <= data_in;		-- When write line goes high, store the value of the 
				WHEN "001" => r1 <= data_in;		-- incoming businto the register determined by SEL1
				WHEN "010" => r2 <= data_in;
				WHEN "011" => r3 <= data_in;
				WHEN "100" => r4 <= data_in;
				WHEN "101" => r5 <= data_in;
				WHEN "110" => r6 <= data_in;
				WHEN "111" => r7 <= data_in;		
				WHEN others => NULL;
			end case;
		end if;
end process;

			



end Behavioral;

