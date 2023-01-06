	.data
cal:	.asciiz "Simple Calculator\n"
msg1: 	.asciiz "Enter first number\n"
msg2:	.asciiz "Enter second number\n"
opera:	.asciiz "1.Add\n2.Sub\n3.Multiply\n4.Modulo\n5.Exit\nEnter your choice\n"
addmsg:	.asciiz "Addtion of two numbers\n"
submsg:	.asciiz "Subtraction of two numbers\n"
mulmsg:	.asciiz "Multiplication of two numbers\n"
modmsg:	.asciiz "Modulo operator of two numbers\n"
newline:.asciiz "\n"
exit:	.asciiz "Exited out of Calculator...\n"
	.text
	
main:
	
	j calculator
	
calculator:
	
	li $v0, 4
	la $a0, cal
	syscall
	
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, opera
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	beq $s2, 1, addtion
	beq $s2, 2, subtraction
	beq $s2, 3, multiplication
	beq $s2, 4, modulo
	beq $s2, 5, Exit
	
	j calculator
	
addtion:
	li $v0, 4
	la $a0, addmsg
	syscall
	
	add $t0, $s0, $s1
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j calculator
	
subtraction:
	li $v0, 4
	la $a0, submsg
	syscall
	
	sub $t0, $s0, $s1
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j calculator
	
multiplication:
	li $v0, 4
	la $a0, mulmsg
	syscall
	
	mul $t0, $s0, $s1
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j calculator
	
modulo:
	li $v0, 4
	la $a0, modmsg
	syscall
	
	rem $t0, $s0, $s1
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	j calculator
	
Exit:	
	li $v0, 4
	la $a0, exit
	syscall
	
	li $v0, 10
	syscall
	
	
	
	