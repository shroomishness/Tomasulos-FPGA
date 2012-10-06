----------------------------------------------------------------------------------
-- File:				SR.vhd  (Status Register)
-- Authors: 		Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:   11:39:11 10/11/2011 
-- Module Name:   SR - Behavioral 
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: 	None

-- Description: 	Stores the Status Flags
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------		ENTITY DECLARATION		---------

entity SR is
    Port ( SR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wline : in  STD_LOGIC;
           SR_out : out  STD_LOGIC_VECTOR (15 downto 0));
end SR;


architecture Behavioral of SR is

begin

-----	WRITE PROCESS	------

process (wline)
begin	
	if wline = '1' THEN		---- This writes to the register if the write line receives a rising edge
		SR_out <= SR_in;
	end if;
end process;


end Behavioral;

