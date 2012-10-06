----------------------------------------------------------------------------------
-- File:				PC.vhd  (Program Counter Register)
-- Authors: 		Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:   11:39:11 10/11/2011 
-- Module Name:   PC - regar 
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: 	None

-- Description: 	Program Counter Register Module. Contains a 16 bit register. 
--						Writes to it when Write line is high
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------		ENTITY DECLARATION		---------

entity PC_REG is
    Port ( PC_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wline : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
end PC_REG;



architecture regar of PC_REG is

begin

-----	WRITE PROCESS	------

process (wline)				---- This writes to the register if the write line receives a rising edge
begin
	if wline = '1' THEN		
		PC_out <= PC_in;
	end if;
end process;



end regar;

