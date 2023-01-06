	.data
txt1:	.asciiz "Enter n:\n"
txt2:	.asciiz "Factorial of n is\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal factorial
	
	move $s0, $v0
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall
	
factorial:
	subi $sp, $sp, 8
	sw $ra, ($sp)
	sw $a0, 4($sp)
	
	li $v0, 1
	ble $a0, 1, fact
	
	subi $a0, $a0, 1
	jal factorial
	
fact:
	lw $ra, ($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	mul $v0, $a0, $v0
	jr $ra
