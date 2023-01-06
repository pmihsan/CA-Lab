	.data
arr:	.word 1,2,3,4,5
txt:	.asciiz "Sum of Array elements\n"
	.text
main:	
	li $t0, 16
	
	li $v0, 4
	la $a0, txt
	syscall
	
	jal revArray
	move $s0, $v0
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
		
revArray:
	li $t5, 1
loop:
	blt $t0, 0, return 
	
	lw $t1, arr($t0)
	mul $t5, $t5, $t1
	
	addi $t0, $t0, -4
	j loop
return:
	move $v0, $t5
	jr $ra
exit:
	li $v0, 10
	syscall