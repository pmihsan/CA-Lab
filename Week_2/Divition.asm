# Program to divide two Number
	.data
msg1:	.asciiz "Enter dividend\n"
msg2:	.asciiz "Enter divisor\n"
remain:	.asciiz "Remainder - "
quo:	.asciiz "\nQuotient - "
	.text
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	la $t0, ($v0)
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	div $t0, $t1
	
	li $v0, 4
	la $a0, remain
	syscall
	
	mflo $s0
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, quo
	syscall
	
	mfhi $s1
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	li $v0, 10
	syscall