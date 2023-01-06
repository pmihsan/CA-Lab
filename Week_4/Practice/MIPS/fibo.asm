	.data
msg:	.asciiz "Enter a number\n"
msg1:	.asciiz "The fibonacci number is\n"
ans1:	.word 0
ans2:	.word 1
	.text
	
main:
	
	li $v0, 4   # Call Print service String
	la $a0, msg # Load String 
	syscall
	
	li $v0, 5   # Call Get interger Service
	syscall
	la $s0, ($v0)
	
	bgt $s0, 2, fibo # Branch on less than two
	
base:
	ble $s0, 0 , return1 # Branch if less than equal to zero
	ble $s0, 2 , return2 # Branch if less than equal to two
	j exit		     # Jump to exit
	
fibo:
	li $t0, 0
	li $t1, 1
	
	li $t2, 1 # for count
	j findSum # Jump to findSum
	
findSum:
	beq $t2, $s0, printRes # Branch on equal to n
	add $t3, $t0, $t1      # c = a + b
	
	la $t0, ($t1)	       # a = b
	la $t1, ($t3)	       # b = c
	addi $t2, $t2, 1       # Incrementing
	j findSum	       # Loop to findSum
	
return1:
	li $v0, 4	       # Call the string service
	la $a0, msg1	       # Load the string
	syscall
	
	li $v0,1	       # Call the integer service
	lw $a0, ans1	       # Load the answer
	syscall
	
	j exit			# Jump to Exit
	
return2:
	li $v0, 4		# Call the string service
	la $a0, msg1		# Load the string
	syscall
	
	li $v0,1		# Call the integer service
	lw $a0, ans2		# Load the answer
	syscall
	
	j exit
	
printRes:
	li $v0, 4		# Call the string service
	la $a0, msg1		# Load the string
	syscall
	
	li $v0, 1		# Call the integer service
	la $a0, ($t3)		# Load the answer
	syscall
	
	j exit			# Jump to Exit

exit:
	
	li $v0, 10		# To Exit
	syscall

