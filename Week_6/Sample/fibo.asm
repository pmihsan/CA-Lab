	.data
txt1:	.asciiz "Enter n:\n"
txt2:	.asciiz "Result is \n"
	.text
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	move $a0, $s0
	jal fibo
	
	move $s1, $v0
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	j exit
	
fibo:	
	bgt $a0, 1, fiboRec
	move $v0, $a0
	jr $ra
	
fiboRec:
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	addi $a0, $a0, -1
	jal fibo
	
	sw $v0, 8($sp)
	lw $a0, 0($sp)
	
	addi $a0, $a0, -2
	jal fibo
	
	lw $t0, 8($sp)
	add $v0, $t0, $v0
	
	lw $ra, 4($sp)
	addi $sp, $sp, 12
	jr $ra
			
exit:
	li $v0, 10
	syscall 

