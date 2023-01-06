	.data
msg1:	.asciiz "Enter first Number\n"
msg2:	.asciiz "Enter second Number\n"
msg3:	.asciiz "The greatest number is \n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	la $s0, ($v0)
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	la $s1, ($v0)
	
greater:
	li $v0, 4
	la $a0, msg3
	syscall
	
	sgt $t0, $s0, $s1
	beq $t0, 1, loadS0
	beq $t0, 0, loadS1
	
loadS0:
	li $v0, 1
	la $a0, ($s0)	
	syscall
	j exit
	
loadS1:
	li $v0, 1
	la $a0, ($s1)
	syscall
	j exit
	
exit:
	li $v0, 10
	syscall