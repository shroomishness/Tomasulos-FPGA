----------------------------------------------------------------------------------
-- File:					PC_ctl.vhd (Program Counter Control Module)
-- Authors: 			Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    	13:02:27 10/11/2011 
-- Module Name:    	PC_ctl - STRUCTURE 
-- Project Name: 		ENEL 353 Digital Logic Project
-- Dependencies: 		PC.vhd

-- Description: 		Program Counter Control Module. Has sub-module PC, is part of CU. 
--							Modifies the Program Counter
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.std_logic_unsigned.all;

----------		ENTITY DECLARATION		-----------

entity PC_ctl is
    Port ( PC_ctl_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_ctl_out : out  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           acti : in  STD_LOGIC);		--	wired to system clock
end PC_ctl;

architecture STRUCTURE of PC_ctl is

-------		SUB_MODULE INCLUDES		-------

component PC_REG is
    Port ( PC_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wline : in  STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

-------		SIGNAL DECLARATIONS		--------

signal REG_out: STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal REG_in: STD_LOGIC_VECTOR (15 downto 0);
signal REG_w: STD_LOGIC;

begin

---------		MODULE INSTANCE DECLARATIONS		----------

-- PC Register Instance.
-- This has an input (16 bit), an output (16 bit), and a write line.
--	When the write line has a rising edge, REG_out receives the value of REG_in.
PC_REGISTER: PC_REG port map (REG_in, REG_w, REG_out);


---------		DIRECTLY WIRED SIGNALS			-------------

PC_ctl_out <= REG_out;	


---------		CLOCK EDGE PROCESS		----------		

process (acti)		-- When clock event
begin 
		if acti = '1' THEN	-- When clock rising edge
			CASE op is
			WHEN "00" => REG_in <= (PC_ctl_in(9 downto 2)) + REG_out;	-- The number contained in bits 9 to 2
																		-- of the opcode are added to the current number in reg
			WHEN "01" => REG_in <= REG_out + 1;		-- Normal case. PC register gets incremented by one
			WHEN "11" => REG_in <= PC_ctl_in;		-- Where PC_ctl_in will be an address register.
			WHEN others => NULL;
			end CASE;
			REG_w <= '1';									-- enable write line
		else
			REG_w <= '0';									-- pull write line low to prepare for next rising clock edge
			
		end if;
end process;
		
end STRUCTURE;

