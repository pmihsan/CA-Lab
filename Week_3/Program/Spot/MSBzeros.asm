	.data
msg:	.asciiz "To make MSB of a number to zero\n"
	.text

main:
	
	li $t0, 0xffffffff
	li $t2, 0x00ffffff
	and $t1, $t0, $t2
	
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 10
	syscall
	
	
	