----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:22:50 10/01/2012 
-- Design Name: 
-- Module Name:    SRAM - Behavioral 
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

entity SRAM is
    Port ( data : inout  STD_LOGIC_VECTOR (15 downto 0);
           address : in  STD_LOGIC_VECTOR (15 downto 0);
           size : inout  STD_LOGIC_VECTOR (7 downto 0);
           direction : in  STD_LOGIC;
           rdy : out  STD_LOGIC);
end SRAM;

architecture Behavioral of SRAM is

begin


end Behavioral;

