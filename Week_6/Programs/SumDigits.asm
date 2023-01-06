	.data
txt:	.asciiz "Enter a number\n"
txt1:	.asciiz "Sum of digits of n is\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0,txt1
	syscall
	
	move $a0, $t0
	li $v0, 0
	jal Sum
	move $s0, $v0
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
	
Sum:
	beqz $a0, return
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	rem $t0, $a0, 10
	add $v0, $v0, $t0
	
	div $a0, $a0, 10
	jal Sum
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
return:
	jr $ra
	
exit:
	li $v0, 10
	syscall