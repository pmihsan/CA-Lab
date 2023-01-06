	.data
txt:	.asciiz "Enter a\n"
txt1:	.asciiz "Enter b\n"
txt2:	.asciiz "GCD of a and b is\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0,txt1
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0,txt2
	syscall
	
	move $a0, $t0
	move $a1, $t1
	
	li $v0, 1
	jal Gcd
	move $s0, $v0
	
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	j exit
	
Gcd:
	beqz $a1, return
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	move $t2, $a0
	move $a0, $a1
	rem $a1, $t2, $a0
	
	#addi $a1, $a1, -1
	jal Gcd
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
return:
	move $v0, $a0
	jr $ra
	
exit:
	li $v0, 10
	syscall
