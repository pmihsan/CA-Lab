	.data
arr:	.word 2,5,7,8,1
txt:	.asciiz "Printing even numbers of the array\n"
txt1:	.asciiz " "
	.text
	
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	la $a0, arr
	li $s0, 5
	move $a1, $s0
	
	jal PrintEven
	
	j exit
	
PrintEven:
	move $s0, $a0
	move $s1, $a1
	
	addi $t0, $s1, -1
	mul $t0, $t0, 4
	
	add $t0, $s0, $t0
	
loop:
	bgt $s0, $t0, return 
	
	lw $t1, 0($s0)
	rem $t2, $t1, 2
	beqz $t2, printAns
	
	addi $s0, $s0, 4
	j loop
	
printAns:
	li $v0, 1
	la $a0, ($t1)
	syscall
	
	li $v0, 4
	la $a0, txt1
	syscall
	
	addi $s0, $s0, 4
	j loop
	
return:
	jr $ra
	
exit:
	li $v0, 10
	syscall