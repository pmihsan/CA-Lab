	.data
arr:	.word 1,2,3,4,5
txt:	.asciiz "Even numbers of the given Array\n"
nl:	.asciiz " "
	.text
main:	
	li $t0, 0
	
	li $v0, 4
	la $a0, txt
	syscall
	
	jal PrintEven
	j exit
		
PrintEven:
loop:
	bgt $t0, 16, return 
	
	lw $t1, arr($t0)
	
	rem $t5, $t1, 2
	beqz $t5, printRes
	
	addi $t0, $t0, 4
	j loop
	
printRes:
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	
	addi $t0, $t0, 4
	j loop
	
return:
	jr $ra
exit:
	li $v0, 10
	syscall
	
	
