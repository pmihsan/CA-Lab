	.data
txt1:	.asciiz "Enter n:\n"
txt2:	.asciiz "Sum of even numbers till n\n"
	.text
	
main:
	li $v0, 4
	la $a0, txt1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, txt2
	syscall
	
	move $a0, $s0
	jal sumOfEven
	move $s1, $v0
	
	li $v0, 1
	la $a0, ($s1)
	syscall
	
	j exit

sumOfEven:
	move $s2, $a0
	li $t0, 0
	li $t1, 0
	j loop
loop:
	bgt $t0, $s2, return 
	add $t1, $t1, $t0
	addi $t0, $t0, 2
	j loop
return:
	move $v0, $t1
	jr $ra
				
exit:
	li $v0, 10
	syscall
	
