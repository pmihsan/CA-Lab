	.data
txt1: 	.asciiz "Enter a number\n"
txt2:	.asciiz "Reverse of number is \n"
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
	li $v0, 0
	jal reverse
	move $t0, $v0
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	j exit
reverse:
	blez $a0, returnVal
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	mul $v0, $v0, 10
	rem $t1, $a0, 10
	add $v0, $v0, $t1
	div $a0, $a0, 10
	jal reverse
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
returnVal:
	jr $ra
exit:
	li $v0, 10
	syscall
