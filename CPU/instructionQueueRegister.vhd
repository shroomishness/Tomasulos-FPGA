----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:47:04 10/10/2012 
-- Design Name: 
-- Module Name:    instructionQueueRegister - Behavioral 
-- Project Name: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionQueueRegister is
    Port ( clock : in  STD_LOGIC;
           OPCODE : out  STD_LOGIC_VECTOR (13 downto 0));
end instructionQueueRegister;

 architecture Behavioral of instructionQueueRegister is

-------		SIGNAL DECLARATIONS		--------

signal iqr0, iqr1, iqr2, iqr3, iqr4, iqr5, iqr6, iqr7 : std_logic_vector (13 downto 0) := "00000000000000"; -- Our 8 14-bit registers, initialised to all zeros.
signal SEL : std_logic_vector (2 downto 0) := "000";

begin

---------------		CONDITIONAL SIGNALS		--------------

	OPCODE <=  iqr0 when SEL = "000" else 					-- OPCODE is mapped to one of the internal registers.
					  iqr1 when SEL = "001" else
					  iqr2 when SEL = "010" else 
					  iqr3 when SEL = "011" else 
					  iqr4 when SEL = "100" else
					  iqr5 when SEL = "101" else
					  iqr6 when SEL = "110" else
					  iqr7 when SEL = "111" else "00000000000000"	;
					  
					  
---------		CLOCK EDGE PROCESS		----------				

process(clock)		-- On clock event
begin
		if clock = '1' THEN			-- On clock edge
		
		case SEL is 					--increment SEL, horrible implementation, but at least it works.
			WHEN "000" => 
				SEL <= "001";
			WHEN "001" =>
				SEL <= "010";
			WHEN "010" =>
				SEL <= "011";
			WHEN "011" =>
				SEL <= "100";
			WHEN "100" =>
				SEL <= "101";
			WHEN "101" =>
				SEL <= "110";
			WHEN "110" =>
				SEL <= "111";
			WHEN OTHERS =>
				SEL <= "000";
		end case;
		
		end if;
end process;

end Behavioral;

