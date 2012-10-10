----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:01:40 10/11/2012 
-- Design Name: 
-- Module Name:    registerStatusTable - Behavioral 
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

entity registerStatusTable is
    Port ( validData : in  STD_LOGIC;									--if the data in the RST is valid (being used) (the first bit of the 4-bit register value)
           writeData : in  STD_LOGIC;									--to write, or not to write, that is the question.
           RSslotNumber : in  STD_LOGIC_VECTOR (2 downto 0);	--pointer to the RS slot (the final 3 bits of the 4-bit register value)
			  invalidate : in STD_LOGIC;									--if true, and writeData is false, then the data at address is made invalid
           address : in  STD_LOGIC_VECTOR (3 downto 0);			--the address to write the data to (or invalidate)
           clock : in  STD_LOGIC;										--clock input
           rstOut0 : out STD_LOGIC_VECTOR (3 downto 0);			--the first 4 bit output, corresponds to the first register validity and value.
			  rstOut1 : out STD_LOGIC_VECTOR (3 downto 0);			--ditto for second register
			  rstOut2 : out STD_LOGIC_VECTOR (3 downto 0);			--third
			  rstOut3 : out STD_LOGIC_VECTOR (3 downto 0);			--etc
			  rstOut4 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut5 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut6 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut7 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut8 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut9 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut10 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut11 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut12 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut13 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut14 : out STD_LOGIC_VECTOR (3 downto 0);
			  rstOut15 : out STD_LOGIC_VECTOR (3 downto 0)			--final register value
			);
end registerStatusTable;

architecture Behavioral of registerStatusTable is

signal 	rst0, rst1, rst2, rst3, rst4, rst5, 
			rst6, rst7, rst8, rst9, rst10, 
			rst11, rst12, rst13, rst14, rst15 
				: std_logic_vector (3 downto 0) := "0000"; -- Our 16 4-bit registers, all initialised to 0000.

begin

	--equating internal signals with outputs
	rstOut0 <= rst0;
	rstOut1 <= rst1;
	rstOut2 <= rst2;
	rstOut3 <= rst3;
	rstOut4 <= rst4;
	rstOut5 <= rst5;
	rstOut6 <= rst6;
	rstOut7 <= rst7;
	rstOut8 <= rst8;
	rstOut9 <= rst9;
	rstOut10 <= rst10;
	rstOut11 <= rst11;
	rstOut12 <= rst12;
	rstOut13 <= rst13;
	rstOut14 <= rst14;
	rstOut15 <= rst15;

	process(clock)
	begin
		if (clock = '1' AND writeData = '1') THEN	--on clock edge, write
			case address is
				WHEN "0000" =>
					rst0(3) <= validData;	--write valid bit
					rst0(2 downto 0) <= RSslotNumber;	--write the rest of the register value
				WHEN "0001" =>
					rst1(3) <= validData;
					rst1(2 downto 0) <= RSslotNumber;
				WHEN "0010" =>
					rst2(3) <= validData;
					rst2(2 downto 0) <= RSslotNumber;
				WHEN "0011" =>
					rst3(3) <= validData;
					rst3(2 downto 0) <= RSslotNumber;
				WHEN "0100" =>
					rst4(3) <= validData;
					rst4(2 downto 0) <= RSslotNumber;
				WHEN "0101" =>
					rst5(3) <= validData;
					rst5(2 downto 0) <= RSslotNumber;
				WHEN "0110" =>
					rst6(3) <= validData;
					rst6(2 downto 0) <= RSslotNumber;
				WHEN "0111" =>
					rst7(3) <= validData;
					rst7(2 downto 0) <= RSslotNumber;
				WHEN "1000" =>
					rst8(3) <= validData;
					rst8(2 downto 0) <= RSslotNumber;
				WHEN "1001" =>
					rst9(3) <= validData;
					rst9(2 downto 0) <= RSslotNumber;
				WHEN "1010" =>
					rst10(3) <= validData;
					rst10(2 downto 0) <= RSslotNumber;
				WHEN "1011" =>
					rst11(3) <= validData;
					rst11(2 downto 0) <= RSslotNumber;
				WHEN "1100" =>
					rst12(3) <= validData;
					rst12(2 downto 0) <= RSslotNumber;
				WHEN "1101" =>
					rst13(3) <= validData;
					rst13(2 downto 0) <= RSslotNumber;
				WHEN "1110" =>
					rst14(3) <= validData;
					rst14(2 downto 0) <= RSslotNumber;
				WHEN "1111" =>
					rst15(3) <= validData;
					rst15(2 downto 0) <= RSslotNumber;
				WHEN OTHERS =>
					--do nothing
			end case;
			
		elsif (clock = '1' AND invalidate = '1') THEN	--if trying to write and invalidate, writing takes precedence.
			case address is
				WHEN "0000" =>
					rst0(3) <= '0';	--clear the valid bit at this address
				WHEN "0001" =>
					rst1(3) <= '0';
				WHEN "0010" =>
					rst2(3) <= '0';
				WHEN "0011" =>
					rst3(3) <= '0';
				WHEN "0100" =>
					rst4(3) <= '0';
				WHEN "0101" =>
					rst5(3) <= '0';
				WHEN "0110" =>
					rst6(3) <= '0';
				WHEN "0111" =>
					rst7(3) <= '0';
				WHEN "1000" =>
					rst8(3) <= '0';
				WHEN "1001" =>
					rst9(3) <= '0';
				WHEN "1010" =>
					rst10(3) <= '0';
				WHEN "1011" =>
					rst11(3) <= '0';
				WHEN "1100" =>
					rst12(3) <= '0';
				WHEN "1101" =>
					rst13(3) <= '0';
				WHEN "1110" =>
					rst14(3) <= '0';
				WHEN "1111" =>
					rst15(3) <= '0';
				WHEN OTHERS =>
					--do nothing
			end case;
		end if;
	end process;
end Behavioral;

