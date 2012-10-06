----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:54 10/08/2011 
-- Design Name: 
-- Module Name:    BIT_AND - Behavioral 
-- Project Name: 353 CPU 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;


entity SUB is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end SUB;

architecture subtra of SUB is
constant WIDTH: integer := 8;
signal INT_CARRY1, INT_CARRY2:std_logic_vector (8 downto 0);
signal INT_BUS1, INT_BUS2: std_logic_vector (7 downto 0);
begin
	
		INT_CARRY1(0) <= '1';
		process (in1, in2)
			begin
			for i in (WIDTH-1) downto 0 loop
				INT_BUS1(i) <= not in2(i);
			end loop;
		end process;
		add_gen:
		for i in 0 to (WIDTH-1) generate
			INT_BUS2(i) <= INT_BUS1(i) xor INT_CARRY1(i);
		INT_CARRY1(i+1) <= INT_CARRY1(i) and INT_BUS1(i);
		end generate;
		
		INT_CARRY2(0) <= '0';
		sub_gen:
		for i in 0 to (WIDTH-1) generate
			result(i) <= (in1(i) xor INT_BUS2(i)) xor INT_CARRY2(i);
			INT_CARRY2(i+1) <= (INT_CARRY2(i) and (in1(i) xor INT_BUS2(i))) or (in1(i) and INT_BUS2(i));
		end generate;



end subtra;
