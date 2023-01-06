	.data
arr:	.word 89,45,18,12,22,4,90,1
txt:	.asciiz "Reversed Array\n"
nl:	.asciiz " "
	.text
main:	
	li $t0, 28
	
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
	
	
