	.data
msg:	.asciiz "Greater of Two Numbers\n"
	.text
	
main:
	li $s0, 2
	li $s1, 5
	
	sgt $t0, $s0, $s1
	beq $t0, 1, load1
	beq $t0, 0, load2
	
exit:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	la $a0, ($s2)
	syscall
	
	li $v0, 10
	syscall
	

load1: 
	la $s2, ($s0)
	j exit
load2:
	la $s2, ($s1)
	j exit

