	.data
txt1:	.asciiz "Enter n:\n"
txt2:	.asciiz "To Print a string n times\n"
txt3:	.asciiz "Hello World!!!\n"
	.text
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	move $a0, $s0
	jal printNtimes
	
	j exit
	
printNtimes:
	subi $sp, $sp, 8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	
	beq $a0, $zero, return
	
	move $s0, $a0
	
	li $v0, 4
	la $a0, txt3
	syscall
	
	move $a0, $s0
	
	subi $a0, $a0, 1
	jal printNtimes
	
return:
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
exit:
	li $v0, 10
	syscall
