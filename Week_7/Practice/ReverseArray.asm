	.data
arr:	.word 1,2,3,4,5
txt:	.asciiz "Reversed Array"
nl:	.asciiz "\n"
	.text
main:	
	li $t0, 16
	
	li $v0, 4
	la $a0, txt
	syscall
	
	jal revArray
	j exit
		
revArray:
	la $s0, arr
	add $t0, $s0, $t0
loop:
	blt $t0, $s0, return 
	
	li $v0, 4
	la $a0, nl
	syscall
	
	li $v0, 1
	lw $t1, 0($t0)
	la $a0, ($t1)
	syscall
	
	addi $t0, $t0, -4
	j loop
return:
	jr $ra
exit:
	li $v0, 10
	syscall
	
	
