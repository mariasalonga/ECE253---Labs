.global _start
.text
_start:
    # Variable List:
    # s2 -> list of words
    # s3 -> pointer of words
    # s4 -> pointer of letters to the words
    # s5 -> -1 constant
    # a0 -> holds final value
    la s2, LIST # Load the memory address into s2
    addi s10, zero, 0 # This the number of the longest string of 1s
    # addi s11, zero, 0 # This is the number of the current string of 1s
    addi s5, zero, -1
    # addi a0, zero, 0 # holds the value of the highest number of consecutive 1s
    LOOP:
        lw s3, 0(s2) # pointer of words
        beq s3, s5, END # if s3 == -1 END
        # bltz a0, END # i dont think we need this
        jal ONES # calling the subroutine
        bge s10, a0, AFTER # if s10 >= s11 ELSE
        addi s10, a0, 0
#   ELSE:
#       addi s10, s11, 0 # do we have to reset s10 to zero
	
    AFTER:
	addi s2, s2, 4
        j LOOP
#

    ONES: 
    	addi a3, s3, 0 # pointer in the word
    	addi a0, zero, 0 # idk if we need this this is the value that saves the count
    	# lw a4, 0(s2) # Register a4 will hold the result what is this??? LOL
    LOOP2:
        beqz a3, DONE # Loop until data contains no more 1’s
        srli s3, a3, 1 # Perform SHIFT, followed by AND
        and a3, a3, s3
        addi a0, a0, 1 # Count the string lengths so far
        #addi a3, a3, 1 # add 1 to the counter a4?
        b LOOP2
    DONE:
    jr ra
END:
ebreak

.global LIST
.data
LIST:
.word 1011, 1111, 0000, 1010, 1110, 1000, 1111, 1011, 0011, 0101, -1