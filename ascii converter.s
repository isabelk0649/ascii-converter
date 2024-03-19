.text           
.global _start
_start:
    ldr    r2, =Data        // Store address of start of data
    ldr    r3, =_Data       // Store address of end of data 
    ldr    r5, =AscIITable  // Store address of start of ASCII table
    ldr    r4, =0x1000       // Store address of output array

Loop:
    ldr    r0, [r2], #4     // Read word from address with post-increment (r0 = *r2, r2 += 4)
    // Converts hexadecimal to ASCII using lookup table
    ldrb   r1, [r5, r0]     // Load ASCII value from lookup table
    strb   r1, [r4], #1     // Store ASCII character in output array and increment address

    cmp    r3, r2           // Compare current address with end of list
    beq    _stop          // If at end, exit loop
	
    b      Loop             // Continue

_stop:
    b _stop

.data
.align 
Data:
    .word   0xA, 0xB, 0xC, 0x1, 0x2, 0x4, 0x9, 0x3
    .word   0xD, 0xF, 0xE, 0x7, 0x5, 0x6, 0x8, 0x0
_Data: 

.align
AscIITable:
    .byte   0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46

.end
