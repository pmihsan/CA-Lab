	.data
txt:	.asciiz "Enter n\n"
txt2:	.asciiz "Result is\n"
star:	.asciiz "* "
nl:	.asciiz "\n"
	.text
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	move $a0, $s0
	li $a1, 0
	jal pat
	j exit
pat:
	beqz $a0, return
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	blt $a1, $a0, printS
	
	move $t0, $a0
	li $v0, 4
	la $a0, nl
	syscall
	move $a0, $t0
	
	addi $a0, $a0, -1
	li $a1, 0
	jal pat
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
printS:
	move $t0, $a0
	li $v0, 4
	la $a0, star
	syscall
	move $a0, $t0
	
	addi $a1, $a1, 1
	jal pat
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
return:
	jr $ra
exit:
	li $v0, 10
	syscall
