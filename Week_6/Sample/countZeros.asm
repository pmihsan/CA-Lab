	.data
txt:	.asciiz "Enter a number\n"
txt1:	.asciiz "Number of zero's in the given number is\n"
	.text
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, txt1
	syscall
	
	move $a0, $t0
	li $v0, 0
	jal countZero
	move $t1, $v0
	
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	j exit
countZero:
	beqz $a0, return
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	rem $t1, $a0, 10
	div $a0, $a0, 10
	beqz $t1, countInc
	jal countZero
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	
countInc:
	addi $v0, $v0, 1
	jal countZero
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
return:
	jr $ra
exit:
	li $v0, 10
	syscall
