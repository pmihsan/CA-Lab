	.data
txt:	.asciiz "Enter base\n"
txt2:	.asciiz "Enter power\n"
txt1:	.asciiz "Power of x to y is\n"
	.text
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, txt1
	syscall
	
	move $a0, $t0
	move $a1, $t1
	
	li $v0, 1
	jal Power
	move $s0, $v0
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
	
Power:
	beqz $a1, return
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	mul $v0, $v0, $a0
	addi $a1, $a1, -1
	jal Power
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	
	
return:
	jr $ra
exit:
	li $v0, 10
	syscall

