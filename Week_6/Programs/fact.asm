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
	
	li $v0, 1
	jal factorial
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit

factorial:
	beq $a0, 1, return
	
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	mul $v0, $v0, $a0
	addi $a0, $a0, -1
	jal factorial
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
return:
	jr $ra
	
exit:
	li $v0, 10
	syscall
