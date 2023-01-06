	.data
msg1:	.asciiz "Enter a number\n"
msg2:	.asciiz "Factorial is\n"
	.text
	
main:
	li $v0, 4    # Call Print service String
	la $a0, msg1 # Load String 
	syscall
	
	li $v0, 5    # Call Get interger Service
	syscall 
	la $s0, ($v0)# Load the value to a register
	li $t0, 1
	
loop:	
	beq $s0, 1, print # Branch on reaches one print the answer
	mul $t0, $t0, $s0 # Multiply each number
	addi $s0, $s0, -1 # Decrement the given number
	j loop		  # Loop to loop
	
print:
	li $v0, 4    # For Calling the string print interger service
	la $a0, msg2 # Load the string
	syscall

	li $v0, 1    # For Calling the integer print service
	la $a0, ($t0)# Load the answer
	syscall

exit:
	li $v0, 10   # To exit out of the program
	syscall

