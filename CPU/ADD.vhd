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


entity ADD is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end ADD;

architecture add of ADD is
constant WIDTH: integer := 8;
signal INT_CARRY : std_logic_vector (8 downto 0);
begin
	
	INT_CARRY(0) <= '0';
full_add_gen:
	
for i in 0 to (WIDTH-1) generate
	result(i) <= (in1(i) xor in2(i)) xor INT_CARRY(i);
	INT_CARRY(i+1) <= (INT_CARRY(i) and (in1(i) xor in2(i))) or (in1(i) and in2(i));
end generate;

end add;
