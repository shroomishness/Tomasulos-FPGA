----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:54 10/08/2011 
-- Design Name: 
-- Module Name:    CMP - compare 
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


entity CMP is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
			  Zflag : out STD_LOGIC;
			  Nflag : out STD_LOGIC);
			  
end CMP;

architecture compare of CMP is
constant WIDTH: integer := 8;
signal temp:std_logic;
signal resolved : std_logic;
begin
	process (in1, in2)
	begin
	resolved <= '0';
		for i in (WIDTH-1) downto 0 loop
			result(i) <= in1(i);
			temp <= in1(WIDTH - i-1) xor in2 (WIDTH - i-1);
			if temp = '1' THEN
				Zflag <= '0';
				if resolved = '0' THEN
					if in1(WIDTH - i-1) = '1' THEN
						Nflag <= '0';
					ELSE Nflag <= '1';
					END IF;
					resolved <= '1';
				END IF;
			END IF;
		end loop;
		if resolved = '0' THEN
			Zflag <= '1';
			Nflag <= '0';
		END IF;
	end process;


end compare;
