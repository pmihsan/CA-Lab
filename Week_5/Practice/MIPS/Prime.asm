	.data
txt1:	.asciiz "Enter a number\n"
txt2:	.asciiz "Given Number is Prime\n"
txt3:	.asciiz "Given Number is not Prime\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	jal findPrime
	
	move $s0, $v0
	
	beqz $s0, NotPrime
	
	beq $s0, 1, Prime
	
	j exit
	
exit:
	li $v0, 10
	syscall
	
Prime:
	li $v0, 4
	la $a0, txt2
	syscall
	
	j exit
	
NotPrime:
	li $v0, 4
	la $a0, txt3
	syscall
	
	j exit
	
findPrime:
	li $t0, 2
	move $s0, $a0
	li $t5, 1
	ble $s0, 1, retZero
	j loop
	
loop:
	mul $t4, $t0, $t0
	bge $t4, $s0, retOne
	rem $t5, $s0, $t0
	beqz $t5, retZero
	addi $t0, $t0, 1
	j loop
		
retOne:
	li $v0, 1
	jr $ra	
	
retZero:
	li $v0, 0
	jr $ra
	