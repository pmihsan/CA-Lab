	.data
arr1:	.word 11,1,5,2,3,12,11,13
arr2:	.word 0,0,0,0,0,0,0,0
spa:	.asciiz " "
txt1:	.asciiz "Number of Occurences of each element in the given array\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $s0, 28
	li $s1, 8
	
	li $t0, 0
	li $t1, 1
	
	li $t3, 0
	li $t4, 1
	
	li $t5, 0
	
	li $t7, 0
	
	li $s6, 0
	li $s7, 1
	
loop:

	bgt $t1, $s1, printArr2
	
	lw $t2, arr1($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	j countloop
	
countloop:
	bgt $t4, $s1, setArray2
	lw $s2, arr1($t3)
	
	
	beq $s2, $t2, increaseCount
	#bne $s2, $t2, inc
	addi $t3, $t3, 4
	addi $t4, $t4, 1
	j countloop
		

increaseCount:

	addi $t7, $t7, 1
	
	addi $t3, $t3, 4
	addi $t4, $t4, 1
	j countloop
	
setArray2:
	sw $t7, arr2($t5)
	addi $t5, $t5, 4
	li $t7, 0
	li $t4, 1
	li $t3, 0
	
	j loop
	
printArr2:
	bgt $s7, $s1, exit
	lw $t8, arr2($s6)
	
	li $v0, 1
	la $a0, ($t8)
	syscall
	
	li $v0, 4
	la $a0, spa
	syscall
	
	addi $s7, $s7, 1
	addi $s6, $s6, 4
	j printArr2
	
exit:
	li $v0, 10
	syscall