----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:29 10/08/2011 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
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

entity MUX is
    Port ( SEL : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           F : out  STD_LOGIC);
end MUX;

architecture STRUCTURE of MUX is

component AOI
	port(A,B,C,D: in STD_LOGIC;
	F: out STD_LOGIC);
end component;

component INV
	port (A: in STD_LOGIC;
	F: out STD_LOGIC);
end component;

signal SELB: STD_LOGIC;

begin

	G1: INV port map(SEL, SELB);
	G2: AOI port map(SEL, A, SELB, B, F);

end STRUCTURE;

