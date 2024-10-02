
			+------------------------------------------------------+	
			\	HandBook for the Nano Processor 	       /
			\				- by Logic Legends     /
			\______________________________________________________/

1.Nano Processor Operation Instructions: 

		-- Instruction Table -- 
  - All the instructions have 14 bits. First 4 bits are op codes and the rest are instructions.
  - All Register are named as R,R1 AND R2 and in range of [0,7]
  - ALl values are named as d and in range of [0,15]
  - All addresses are named as i and in range of [0,7]
			
+----------------------------------------------------------------------------------------------------------------------------------------+
| Instruction | Format (14-bit representation) | Description                                   					         |
|-------------|---------------------------------|----------------------------------------------------------------------------------------+
| movi R,d    | 0010  111   000   1010          | Move immediate value d=1010 to register R=111        				         |
| add R1,R2   | 0000  111   101   0000          | Add the values in registers R1=111 and R2=101 and store result in R1			 |
| neg R       | 0001  111   000   0000          | Get the two's complement of the value in register R=111 and store in the same register |
| JZR R,i     | 0011  111   000   0101          | Jump to instruction i=101 if the value in register R=111 is zero 			 |
| sub R1,R2   | 0100  101   001   0000          | Subtract the value in register R2=001 from R1=101, store in R1			 |
| NOP         | 0101  000   000   0000          | No operation, pass clock cycle                				         |
| JMP i       | 0110  000   000   0111          | Jump to instruction i=111 unconditionally        					 |
+----------------------------------------------------------------------------------------------------------------------------------------+


2. LED Signal/Seven-Segment Display Mapping:
   - The R7(111) indexed register's contents are mapped to the LED bulbs (U16 to U19 LEDs) as follows:
     - Bit 0 (LSB) -> U16
     - Bit 1 -> U17
     - Bit 2 -> U18
     - Bit 3 -> U19
   - And when the R7 value provided into lookup table for getting seven segment display output is mapped as this 
     - W7 -> Bit 0 (LSB)
     - W6 -> Bit 1
     - U8 -> Bit 2
     - V8 -> Bit 3
     - U5 -> Bit 4
     - V5 -> Bit 5
     - U7 -> Bit 6

   -Other LED signals
	- Zero      - P1
	- Overflow  - N3
	- Carry out - L1
	- Greater   - W3
	- Equal     - U3
	- Lesser    - P3 

3. Allocated Reset Button:
   - The allocated reset button for the nano processor is [U18]. Pressing this button will set all register values to zero and the program counter to 000, starting the processor.

4. Starting the Nano Processor:
   - To start the nano processor, press the reset button. This will set all register values to zero and the program counter to 000, effectively resetting the processor and preparing it to start executing instructions.

5. Expected Behavior of the Circuit:
   - When performing arithmetic operations (add, sub), the result will be stored in first register given with instructions . If the result is zero, the zero bulb  will light up.
     Overflow  and carry (L1) out bulbs will indicate overflow and carry out conditions, respectively.
   - The comparator connected to the adder-subtractor unit will light up the greater bulb  if the first register's value is higher than the second's. The equal (U3) and lower (P3) bulbs will light up accordingly.
