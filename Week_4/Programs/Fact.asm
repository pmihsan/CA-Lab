	.data
msg1:	.asciiz "Enter a number\n"
msg2:	.asciiz "Factorial of the number\n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0, 1
	
loop:
	beq $s0, 1, printRes
	
	mul $t0, $t0, $s0
	
	addi $s0, $s0, -1
	j loop
	
printRes:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
exit:
	li $v0, 10
	syscall
