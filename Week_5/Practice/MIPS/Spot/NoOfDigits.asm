	.data
txt1:	.asciiz "Enter n\n"
txt2:	.asciiz "No of digits\n"
txt3:	.asciiz "\nReverse of number is\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal findDigits
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	li $v0, 4
	la $a0, txt3
	syscall
	
	li $v0, 1
	la $a0, ($v1)
	syscall
	
	j exit
	
findDigits:
	move $s0, $a0
	j loop

loop:
	blez $s0, returnAnswer
	rem $t5, $s0, 10
	mul $t6, $t6, 10
	add $t6, $t6, $t5
	addi $t0, $t0, 1
	div $s0, $s0, 10
	j loop
	
returnAnswer:
	move $v1, $t6
	move $v0, $t0
	jr $ra
	
exit:
	li $v0, 10
	syscall