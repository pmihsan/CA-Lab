	.data
msg:	.asciiz "Enter n:\n"
res:	.asciiz "Sum of odd numbers till n:\n"
	.text

main:
	li $v0, 4	# Call the string service
	la $a0, msg	# Load the string
	syscall
	
	li $v0, 5	# Call the get integer service
	syscall
	la $s0, ($v0)
	
	li $t0, 0
	li $t1, 1
	
	j SumOdd	# Jump to SumOdd
	
SumOdd:
	bgt $t1, $s0, print	# Branch on greater than n
	
	add $t0, $t0, $t1 
	addi $t1, $t1, 2
	
	j SumOdd	# Jump to SumOdd
	
print:
	li $v0, 4	# Call the string service
	la $a0, res	# Load the string
	syscall
	
	li $v0, 1	# Call the integer service
	la $a0, ($t0)	# Load the answer
	syscall
	
	j exit		# Jump to Exit
	
exit:
	li $v0 ,10	# To Exit
	syscall

