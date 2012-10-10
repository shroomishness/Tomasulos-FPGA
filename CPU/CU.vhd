----------------------------------------------------------------------------------
-- File:			CU.vhd		(Control Unit)
-- Authors: 	Jared P. Keeman  &  Zacharias J. Frank
-- 
-- Create Date:    16:00:52 10/11/2011 
-- Module Name:    CU - Struct
-- Project Name: 	ENEL 353 Digital Logic Project
-- Dependencies: ALU.vhd, PC_ctl.vhd, Register.vhd, ADR_Ctl.vhd, SR.vhd

-- Description: Top Module, the control unit. Links all other modules together and communicates with the MMU.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

----------		ENTITY DECLARATION		-----------

entity CU is
    Port ( ins_data : in  STD_LOGIC_VECTOR (15 downto 0);
           ins_addr : out  STD_LOGIC_VECTOR (15 downto 0);
           ins_req : out  STD_LOGIC;
           ins_ack : in  STD_LOGIC;
			  clock: in STD_LOGIC;
           dat_addr : out  STD_LOGIC_VECTOR (15 downto 0);
           dat_data : inout  STD_LOGIC_VECTOR (7 downto 0);
           dat_read : out  STD_LOGIC;
           dat_req : out  STD_LOGIC;
           dat_ack : in  STD_LOGIC;
			  test : out  STD_LOGIC_VECTOR (7 downto 0);				-- Debugging outputs
			  regout1,regout2, alout : out  STD_LOGIC_VECTOR (7 downto 0));  -- Debugging Outputs
end CU;

architecture CPU_STRUCT of CU is

----------  	MODULE INCLUDE DECLARATIONS	  -----------

component ALU is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  SEL : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ZFlag : out  STD_LOGIC;
           NFlag : out  STD_LOGIC);
end component;

component ALU2 is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  SEL : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           ZFlag : out  STD_LOGIC;
           NFlag : out  STD_LOGIC);
end component;

component PC_ctl is
    Port ( PC_ctl_in : in  STD_LOGIC_VECTOR (15 downto 0);
           PC_ctl_out : out  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           acti : in  STD_LOGIC);
end component;

component Reg is
	
	PORT( wline 	: in std_logic;
			SEL1,SEL2: in std_logic_vector (2 downto 0);
			data_in	: in std_logic_vector (7 downto 0);
			data_out1: out std_logic_vector (7 downto 0);
			data_out2: out std_logic_vector (7 downto 0));
end component;

component ADR_ctl is
    Port ( ADR_in : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL : in  STD_LOGIC_VECTOR (1 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           acti : in  STD_LOGIC;
           ADR_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component SR is
Port ( SR_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wline : in  STD_LOGIC;
           SR_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

------------		SIGNAL DECLARATIONS		-------------

-- Internal Control Unit signals
signal opcode: STD_LOGIC_VECTOR (5 downto 0);
signal ldd: STD_LOGIC_VECTOR (7 downto 0);
signal r1, r2: STD_LOGIC_VECTOR (2 downto 0);

-- ALU Signals
signal ALU_out: STD_LOGIC_VECTOR (7 downto 0);

-- Status Register Signals
signal SR_in :STD_LOGIC_VECTOR (15 downto 0); 
signal SR_out: STD_LOGIC_VECTOR (15 downto 0); 

-- PC Control Signals
signal PC_in :STD_LOGIC_VECTOR (15 downto 0);         
signal PC_op :STD_LOGIC_VECTOR (1 downto 0);

-- Register Signals
signal	R_wline 	: std_logic;
signal	R_SEL1,R_SEL2: std_logic_vector (2 downto 0);
signal	R_data_in	: std_logic_vector (7 downto 0);
signal	R_data_out1: std_logic_vector (7 downto 0);
signal	R_data_out2: std_logic_vector (7 downto 0);

-- Address Signals
signal ADR_SEL : STD_LOGIC_VECTOR (1 downto 0);
signal ADR_op : STD_LOGIC_VECTOR (2 downto 0);
signal ADR_out : STD_LOGIC_VECTOR (15 downto 0);

begin

--------------		MODULE INSTANCES		---------------

-- ALU Instance. 
-- Inputs are wired directly to register module outputs, Cin/Cout are wired
-- directly to the Status Register. Opcode is first six bits of incoming instruction data_bus 
CPU_ALU: ALU port map (R_data_out1, R_data_out2, opcode, ALU_out, SR_out(0), SR_in(0), SR_in(1), SR_in(2));

-- Program Counter Instance. 
-- Inputs are PC_in, output is directly wired to MMU, 
-- PC_op is a mini opcode to instruct the PC ctrl module. Writes on a rising clock edge.
CPU_PC : PC_ctl port map (PC_in, ins_addr, PC_op, clock);

-- Register bank instance. 
-- 1 data input bus, a write line, two select lines which 
-- determine which registers are mapped to the two data bus outputs.  
CPU_REG: Reg port map (R_wline, R_SEL1, R_SEL2, R_data_in, R_data_out1, R_data_out2);

-- Address Register Bank and Address Register Ctrl Module.
-- Write Line wired to clock, data input wired directly to GP register module output1 (8 bits),
-- mini opcode, Select line, and output bus (16 bits)
CPU_ADR: ADR_ctl port map (R_data_out1, ADR_SEL, ADR_op, clock, ADR_out);

-- Status Register Instance.
-- Write Line wired to clock, output and input wired to ALU
CPU_SR : SR port map (SR_in, clock, SR_out);

--------------		DIRECTLY WIRED SIGNALS		-------------------

opcode <= ins_data (15 downto 10);			-- The first six bits are the main instructions of each opcode
ldd <= ins_data (9 downto 2);					-- When using load or store immediate, these bits contain the number
R_SEL2 <= ins_data (2 downto 0);
alout <= ALU_out;					--------v
test <= R_data_in;					--------->	These are debugging outputs, 
regout1 <= R_data_out1;				--------->	and are not connected to the MMU
regout2 <= R_data_out2;			--------^
dat_addr <= ADR_out;				-- This is the data address bus, wired directly to the 
										--output of the address register control module

---------------		CONDITIONAL SIGNALS		--------------

-- This determines which part of the opcode contains the number of our ry input
R_SEL1 <=  ('0' & ins_data(1 downto 0)) when opcode = "100001" else -- Load Immediate
				ins_data(2 downto 0) when (opcode = "000100") or --Move reg into adr_reg
				(opcode = "000001") or					-- Load Direct
				(opcode = "001001") or					-- Load Direct auto inc
				(opcode = "010001") else				-- Load Direct auto dec
				ins_data (7 downto 5);					-- all other cases
				
-- This determines the actions that the Address control module undertakes this cycle				
ADR_op	<= "00" & ins_data(8) when opcode = "000100" else -- Move Register to addr_reg 
																			  --(addr_ctrl takes the specified register 
																			  -- and puts its contents in the address register)
				--increment address
				"010" when opcode = "001001" else 		-- Load Direct auto inc
				"010" when opcode = "001101" else		-- Store Indirect auto inc
				--decrement address
				"011" when opcode = "010001" else		-- Load Direct auto dec
				"011" when opcode = "010110" else 		-- Store Indirect auto dec
				--keep address the same
				"100";											-- All other cases
				
-- This determines which address register is being read from and written to.				
ADR_SEL <= ins_data(1 downto 0) when opcode = "100101" else 	-- Store immediate
			  ins_data(1 downto 0) when opcode = "111111" else		-- Move from adr_reg to rx
			  ins_data(6 downto 5);											-- All other cases
			  
-- This specifies contents of the data bus going into the PC.   
PC_in <=   ADR_out when opcode = "011111" else -- Store address register into PC
			  ins_data;									  -- Add a number to PC (a few different opcodes do this) 

-- Program Counter Operations, "00" means branch, "11" means take new input, "01" means increment by 1
PC_op <=   "00" when opcode = "111011" else
			  "00" when ((opcode = "100011") and (SR_out(1) = '1')) else	-- BEQ
			  "00" when ((opcode = "100111") and (SR_out(1) = '0')) else	-- BNE
			  "00" when ((opcode = "101011") and (SR_out(1) = '0') and (SR_out(2) = '1')) else -- BLT
			  "00" when ((opcode = "101111") and (SR_out(1) = '0') and (SR_out(2) = '0')) else --BGT
			  "00" when ((opcode = "110011") and (SR_out(0) = '1')) else	-- BC
			  "00" when ((opcode = "110111") and (SR_out(0) = '0')) else	-- BNC
			  "11" when opcode = "011111" else 										-- JMP (change PC to what is on adr_reg)
			  "01";									-- on every other instruction, incremement the program counter by one

-- When this line is low we can write onto the data line, otherwise we are not allowed to
dat_read <= '0' when  (((opcode = "000101") or 			-- These are
								(opcode = "100101") or 			-- all the
								(opcode = "001101") or			-- store instruction
								(opcode = "010101")) and 		-- opcodes
							  (dat_ack = '1')) else				-- The acknowledge line must be high from the MMU
				'1';													-- else we are not allowed to write

-- This line is our request to the MMU				
dat_req <= '1' when ((opcode = "000101") or (opcode = "100101") or 
							(opcode = "001101") or (opcode = "010101")) else
			  '0';		-- When we don't want to write, we don't request
				
				
---------		CLOCK EDGE PROCESS		----------				

process(clock)		-- On clock event
begin
		if clock = '1' THEN			-- On clock edge
		
		case opcode is
			WHEN "000010" | "000110" | "001010" | "001110" | "010010" | "010110" |	
				"011010" | "011110" | "001000" | "001100" =>  -- Any ALU operation
				R_data_in <= ALU_out;		-- This is the value to be written 
													-- to the register defined by the status of SEL1
			WHEN "100001" =>					-- Load Immediate
				R_data_in <= ldd;				-- Where ldd is simply the part of the opcode containing the 8-bit number
				
			WHEN "111111" =>					-- Move adr_reg to a register
				if ins_data(3) = '1' THEN					-- If the n bit in the opcode is set
					R_data_in <= ADR_out(15 downto 8);  -- Then move the high part of the adr_reg
				else
					R_data_in <= ADR_out( 7 downto 0);	-- Else move the lower end of the adr_reg
				end if;
				
			WHEN "111110" =>									-- Move one register to another
				R_data_in <= R_data_out2;					-- reg determined by SEL1 equals reg determined by SEL2
				
			WHEN "000001" | "001001" | "010001" =>		-- All load operations
				R_data_in <= dat_data;						-- Register input is the what is on the data line
				
			WHEN "000101" | "001101" | "010101" =>		-- All store indirect operations
				if dat_ack = '0' THEN						-- Only if MMU lets us
					dat_data <= R_data_out2;				-- data bus is assigned register output defined by SEL2
				end if;
				R_data_in <= R_data_out1;					-- Make sure register defined by SEL1 doesn't change
				
			WHEN "100101" =>									-- Store Immediate
				if dat_ack = '0' THEN						-- Only if MMU lets us
					dat_data <= ldd;							-- data line is that part of the opcode 
				end if;											-- which has the number on it
				R_data_in <= R_data_out1;					-- Make sure register defined by SEL1 doesn't change
				
			WHEN others =>										-- All other cases don't write the GP registers
				R_data_in <= R_data_out1;					-- So make sure register defined by SEL1 doesn't change
		end case;
		R_wline <= '1';										-- This will make all registers (REG, PC, ADR, SR be written to)
		else
			R_wline <= '0';									-- To prepare for next clock edge
		end if;
end process;
end CPU_STRUCT;

