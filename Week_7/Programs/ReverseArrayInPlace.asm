	.data
arr:	.word 1,2,3,4,5
txt:	.asciiz "Reversed Array\n"
nl:	.asciiz " "
	.text
main:	
	li $t0, 16
	li $t1, 16
	
	li $v0, 4
	la $a0, txt
	syscall
	
	jal revArray
	
	move $a0, $t1
	jal printArray
	j exit
		
revArray:
	la $s0, arr
	add $t0, $s0, $t0
loop:
	bge $s0, $t0, return 
	
	lw $t5, 0($t0)
	lw $t6, 0($s0)
	
	sw $t6, 0($t0)
	sw $t5, 0($s0)
	
	
	addi $t0, $t0, -4
	addi $s0, $s0, 4
	j loop
	
printArray:
	li $t7, 0
	move $t1, $a0
	j printLoop
	
printLoop:
	bgt $t7, $t1, return
	 
	li $v0, 1
	lw $a0, arr($t7)
	syscall
	 
	li $v0, 4
	la $a0, nl
	syscall
	 
	addi $t7, $t7, 4
	j printLoop 
	 
return:
	jr $ra
	
exit:
	li $v0, 10
	syscall
	
	
