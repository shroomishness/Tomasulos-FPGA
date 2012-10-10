----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:26 10/10/2012 
-- Design Name: 
-- Module Name:    dataRegister - Behavioral 
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

entity dataRegister is
    Port ( clock : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           WriteData : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (3 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (7 downto 0));
end dataRegister;

architecture Behavioral of dataRegister is

-------		SIGNAL DECLARATIONS		--------

signal dr0, dr1, dr2, dr3, dr4, dr5, dr6, dr7 : std_logic_vector (7 downto 0) := "00000000"; -- Our 8 registers

begin
					  
					  
---------		CLOCK EDGE PROCESS		----------				

process(clock)		-- On clock event
begin
		if (clock = '1' AND WriteData = '0') THEN			-- On clock edge, read
		
			case address is 
				WHEN "0000" => 
					dataOut <= dr0;
				WHEN "0001" =>
					dataOut <= dr1;
				WHEN "0010" =>
					dataOut <= dr2;
				WHEN "0011" =>
					dataOut <= dr3;
				WHEN "0100" =>
					dataOut <= dr4;
				WHEN "0101" =>
					dataOut <= dr5;
				WHEN "0110" =>
					dataOut <= dr6;
				WHEN "0111" =>
					dataOut <= dr7;
				WHEN OTHERS =>
					dataOut <= "00000000";
			end case;
	
		elsif (clock = '1' AND WriteData = '1') THEN	-- On clock edge, write
			case address is 
				WHEN "0000" => 
					dr0 <= dataIn;
					--dataOut <= dataIn;
				WHEN "0001" =>
					dr1 <= dataIn;
				WHEN "0010" =>
					dr2 <= dataIn;
				WHEN "0011" =>
					dr3 <= dataIn;
				WHEN "0100" =>
					dr4 <= dataIn;
				WHEN "0101" =>
					dr5 <= dataIn;
				WHEN "0110" =>
					dr6 <= dataIn;
				WHEN "0111" =>
					dr7 <= dataIn;
				WHEN OTHERS =>
					--do nothing
			end case;
		
		end if;	
		
end process;


end Behavioral;

