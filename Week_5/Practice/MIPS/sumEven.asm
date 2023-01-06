	.data
txt1:	.asciiz "Enter n\n"
txt2:	.asciiz "The result is \n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal findEvenSum
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall
	
findEvenSum:
	move $s0, $a0
	li $t0, 0
	j loop
	
loop:
	bgt $t0, $s0, return
	add $t5, $t5, $t0
	addi $t0, $t0, 2
	j loop
	
return:
	move $v0, $t5
	jr $ra