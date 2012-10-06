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


entity ADDC is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in  STD_LOGIC;
			  clock: in STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Cout: out STD_LOGIC);
			  
end ADDC;

architecture addc of ADDC is
constant WIDTH: integer := 8;
signal INT_CARRY:std_logic;
begin
	process (in1, in2,clock)
	begin
		INT_CARRY <= Cin;
		for i in (WIDTH-1) downto 0 loop
			result(i) <= (in1(i) xor in2(i)) xor INT_CARRY;
			INT_CARRY <= (INT_CARRY and (in1(i) xor in2(i))) or (in1(i) and in2(i));
		end loop;
		Cout <= INT_CARRY;
	end process;


end addc;
