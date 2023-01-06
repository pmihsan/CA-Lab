	.data
txt1:	.asciiz "Enter a number\n"
txt2:	.asciiz "Prime Number\n"
txt3:	.asciiz "Not a Prime Number\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	move $a0, $s0
	jal prime
	beqz $v0, notPrime
	bnez $v0, Prime
	
	j exit
prime:
	li $t0, 2
	j primeCheck
primeCheck:
	mul $t7, $t0, $t0
	bgt $t7, $a0, setPrime
	rem $t1, $a0, $t0
	beqz $t1, setNotPrime
	addi $t0 ,$t0, 1
	j primeCheck
setPrime:
	li $v0, 1
	jr $ra
setNotPrime:
	li $v0, 0
	jr $ra
Prime:
	li $v0, 4
	la $a0, txt2
	syscall
	j exit
notPrime:
	li $v0, 4
	la $a0, txt3
	syscall
	j exit
exit:
	li $v0, 10
	syscall
