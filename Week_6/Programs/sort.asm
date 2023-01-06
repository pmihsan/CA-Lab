	.data
arr:	.space 40
txt1:	.asciiz "Enter n:\n"
txt2:	.asciiz "Enter an element\n"
res: 	.asciiz "The sorted array is\n"
sp:	.asciiz " "
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0, 1
	li $t1, 0
	j loop
	
loop:
	bgt $t0, $s0, print
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 5
	syscall
	move $t7, $v0
	
	sw $t7, arr($t1) 
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j loop
	
print:
	li $t0, 1
	li $t1, 0
	
	li $v0, 4
	la $a0, res
	syscall
	
	move $a0, $s0
	jal sort
	
	j printArray
	
sort:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $t2, 1
	li $t3, 0
	
	li $t4, 0
	li $t6, 4
	
	move $s1, $a0
	mul $t5, $s1, 4
	sub $t5, $t5, 4
	j checkFor1
	
checkFor1:
	bgt $t2, $s1, exitFunct
	
checkFor2:
	bgt $t6, $t5, increment
	
	lw $s2, arr($t4)
	lw $s3, arr($t6)
	
	sgt $t8, $s2, $s3
	beq $t8, 0, update
	
	move $a1, $t4
	move $a2, $t6
	jal swap 
	
update:
	addi $t4, $t4, 4
	addi $t6, $t6, 4
	j checkFor2
swap:
	sw $s3, arr($a1)
	sw $s2, arr($a2)
	jr $ra
	
increment:
	addi $t2, $t2, 1
	addi $t3, $t3, 4
	
	li $t4, 0
	li $t6, 4
	j checkFor1
	
exitFunct:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	

printArray:
	bgt $t0, $s0, exit
	lw $t7, arr($t1)
	
	li $v0, 1
	la $a0, ($t7)
	syscall
	
	li $v0, 4
	la $a0, sp
	syscall
	
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	j printArray
exit:
	li $v0, 10
	syscall

