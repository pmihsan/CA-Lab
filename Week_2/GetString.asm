	.data
msg1:	.asciiz "Enter a string\n"
res:	.asciiz "The result is\n"
buffer: .space 50
	.text
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 50
	
	syscall
	
	li $v0, 4
	syscall
	
	#la $a0, res
	#syscall

	
	li $v0, 10
	syscall
