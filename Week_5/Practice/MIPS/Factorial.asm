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
	jal findFactorial
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 10
	syscall
	
findFactorial:
	li $t0, 1
	move $s0, $a0
	li $t5, 1
	beqz $s0, retOne
	beq $s0, 1, retOne
	j loop
	
loop:
	bgt $t0, $s0, return
	mul $t5, $t5, $t0 
	addi $t0, $t0, 1
	j loop
	
return:
	move $v0, $t5
	jr $ra
	
retOne:
	move $v0, $t5
	jr $ra