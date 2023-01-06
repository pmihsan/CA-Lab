	.data
txt1:	.asciiz "Enter n\n"
msg:	.asciiz "Enter a number\n"
txt2:	.asciiz "Max Element is\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal FindGreatest
	
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
	
FindGreatest:
	li $t0, 2
	move $s1, $a0
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t5, $v0
	
	j loop
loop:
	bgt $t0, $s1, returnAnswer
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	addi $t0, $t0, 1
	bgt $t1, $t5, setMax
	j loop
	
setMax:
	move $t5, $t1
	j loop
	
returnAnswer:
	move $v0, $t5
	jr $ra
	
exit:
	li $v0, 10
	syscall