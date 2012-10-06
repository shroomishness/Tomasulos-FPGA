----------------------------------------------------------------------------------
-- File:				ADD_Ctl  (Address Register Control Module)
-- Authors: 		Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:   14:49:06 10/11/2011  
-- Module Name:   ADR_ctl - Behavioral 
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: 	ADD_R.vhd

-- Description: 	Manipulates the address registers
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.std_logic_unsigned.all;

------		ENTITY DECLARATION		---------

entity ADR_ctl is
    Port ( ADR_in : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           acti : in  STD_LOGIC;
           ADR_out : out  STD_LOGIC_VECTOR (15 downto 0));
end ADR_ctl;


architecture Behavioral of ADR_ctl is

-------		SUB_MODULE INCLUDES		-------

component ADD_R is
    Port ( ADD_in : in  STD_LOGIC_VECTOR (15 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           wline : in  STD_LOGIC;
           ADD_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

-------		SIGNAL DECLARATIONS		--------

signal Curr_adr: STD_LOGIC_VECTOR (15 downto 0);
signal ADR_buffer: STD_LOGIC_VECTOR (15 downto 0);
signal ADR_w: STD_LOGIC;

begin

---------		MODULE INSTANCE DECLARATIONS		----------

-- Address Register Bank Instance.
-- 16 bit input, 16 bit output, A select line to choose which register to read/write, and a write line
-- Select line is wired directly through from the control unit
AD_REG: ADD_R port map (ADR_buffer, SEL,  ADR_W, Curr_adr);


---------		DIRECTLY WIRED SIGNALS			-------------

ADR_out <= Curr_adr;


---------		CLOCK EDGE PROCESS		----------	

process (acti)
begin 
		if acti = '1' THEN			-- On rising clock edge
			CASE op is
				WHEN "000" => ADR_buffer(7 downto 0) <= ADR_in;		-- This is a Move ayn <-- rx, lower half
				WHEN "001" => ADR_buffer(15 downto 8) <= ADR_in;	-- This is a Move ayn <-- rx, upper half
				WHEN "010" => ADR_buffer <= Curr_adr + 1;				-- Incremenet Address by one 
				WHEN "011" => ADR_buffer <= Curr_adr - 1;				-- Decrement Address by one
				WHEN "100" => ADR_buffer <= Curr_adr;					-- Retain Address Register Value
				WHEN others => NULL;
			end CASE;
			ADR_w <= '1';					-- Enable Write
		else
			ADR_w <= '0';					-- Disable Write
		end if;
end process;


end Behavioral;

