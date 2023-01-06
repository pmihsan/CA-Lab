	.data
msg1:	.asciiz "Enter a number\n"
msg2:	.asciiz "Sum of odd numbers till n\n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t2, 0
	li $t3, 1
	
loop:
	bgt $t3, $s0, printRes
	add $t2, $t2, $t3
	addi $t3, $t3, 2
	j loop
	
	
printRes:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
exit:
	li $v0, 10
	syscall