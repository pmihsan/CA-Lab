	.data
arr:	.word 1,2,3,4,5,6,7
txt:	.asciiz "Rotate Array\n"
txt2:	.asciiz "Enter n:\n"
nl:	.asciiz " "
	.text
main:	
	li $t0, 24
	
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall 
	move $s0, $v0
	li $s1, 0
	
	li $v0, 4
	la $a0, txt
	syscall
	
rotateN:
	beq $s1, $s0, exec
	jal rotateArray
	addi $s1, $s1, 1
	j rotateN
	
exec:
	move $a0, $t1
	jal PrintArray
	j exit
		
rotateArray:
	li $t1, 0
	li $t2, 4
	lw $t3, arr($t1)
	addi $t7, $t0, 4
loop:

	bge $t2, $t7, befRet
	lw $t4, arr($t2)
	add $t2, $t2, 4
	lw $t5, arr($t2)
	
	sw $t4, arr($t1)
	addi $t2, $t2, -4
	sw $t5, arr($t2)
	
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	j loop
befRet:
	sw $t3, arr($t0)
	j return
return:
	jr $ra
PrintArray:
	move $t6, $a0
	li $t7, 0
print:
	bgt $t7, $t6, return
	li $v0, 1
	lw $a0, arr($t7)
	syscall
	
	li $v0, 4
	la $a0, nl
	syscall
	addi $t7, $t7, 4
	
	j print
	
exit:
	li $v0, 10
	syscall
	
