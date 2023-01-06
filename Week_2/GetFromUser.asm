# Program to add two Number
	.data
msg1:	.asciiz "Enter first number\n"
msg2:	.asciiz "Enter Second number\n"
res:	.asciiz "The result is\n"
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
	
	add $s0, $t0, $t1
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
