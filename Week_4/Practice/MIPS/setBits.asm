	.data
msg1:	.asciiz "Enter n:\n"
msg2:	.asciiz "Number of set bits\n"
	.text
	
main:
	li $v0, 4	# Call the string service
	la $a0, msg1	# Load the string
	syscall
	
	li $v0, 5	# Call the get integer service
	syscall		
	la $s0, ($v0)
	
	li $s1, 0
	
	j setBits	# Jump to setBits
	
setBits:
	ble $s0, 0 , print	# Branch on less than zero 
	
	addi $s1, $s1, 1
	
	add $t0, $s0, -1
	and $s0, $s0, $t0
	
	j setBits		# Loop to setBits
	
print:
	li $v0, 4	# Call the string service
	la $a0, msg2	# Load the string
	syscall
	
	li $v0, 1	# Call the integer service
	la $a0, ($s1)	# Load the answer
	syscall
	
	j exit		# Jump to exit
	
exit:
	li $v0, 10	# To Exit
	syscall

