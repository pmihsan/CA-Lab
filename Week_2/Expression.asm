	.data
msg:	.asciiz "A Simple Expression - n(n + 3)\n"
msg1:	.asciiz "Enter n: "
result:	.asciiz "\nResult\n"
	.text
	
	la $a0, msg
	li $v0, 4
	syscall	
	
	la $a0, msg1
	syscall
	
	# res = n (n + 3)
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	addi $t1, $t0, 3
	mul  $t2, $t1, $t0
	
	la $a0, ($t2)
	li $v0, 1
	syscall
	
	#sw $t2, 0($gp)
	
	li $v0, 10
	syscall
	
	
	
	