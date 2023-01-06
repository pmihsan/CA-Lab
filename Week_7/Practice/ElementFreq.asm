	.data
arr:	.word 1,4,3,4,5
txt:	.asciiz "Enter an element to get its frequency\n"
	.text
main:	
	li $t0, 0
	
	li $v0, 4
	la $a0, txt
	syscall
	
	jal revArray
	move $t7, $v0
	
	li $v0,1
	la $a0, ($t7)
	syscall
	j exit
		
revArray:
	li $v0, 5
	syscall
	move $s0, $v0
loop:
	bgt $t0, 16, return 
	
	lw $t1, arr($t0)
	beq $t1, $s0, increment
	
	addi $t0, $t0, 4
	j loop
	
increment:
	addi $t5, $t5, 1
	addi $t0, $t0, 4
	j loop
return:
	move $v0, $t5
	jr $ra
exit:
	li $v0, 10
	syscall
	
	
