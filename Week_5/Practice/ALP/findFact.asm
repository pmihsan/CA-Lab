	.data
text1:	.asciiz "Enter n:\n"
res:	.asciiz "Factorial of n is\n"
	.text
	
main:	
	li $v0, 4
	la $a0, text1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	beqz $s0, printExit
	
	move $a0, $s0
	
	jal fact
	move $s3, $v0
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	la $a0, ($s3)
	syscall
	j exit
	
fact:
	li $t0, 1
	move $s1, $a0
	li $s2, 1
	j loop
	
loop:
	bgt $t0, $s1, return
	mul $s2, $s2, $t0
	addi $t0, $t0, 1
	j loop
	
return :
	move $v0, $s2
	jr $ra
	
printExit:
	li $v0, 4
	la $a0, res
	syscall
	li $v0 ,1
	addi $a0 , $t7, 1
	syscall
	j exit
exit:
	li $v0, 10
	syscall

