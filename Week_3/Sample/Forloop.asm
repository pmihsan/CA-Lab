	.data
msg:	.asciiz "Loop to print 1 to n numbers\n"
line:	.asciiz "\n"
	.text
	
main:
	li $t0, 1
	
	li $v0, 5
	syscall
	la $t1, ($v0)
	
	li $v0, 4
	la $a0, msg
	syscall
	
WhileLoop:
	
	bgt $t0, $t1, exit
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, line
	syscall
	
	addi $t0, $t0, 1
	
	j WhileLoop
	
exit:
	li $v0, 10
	syscall