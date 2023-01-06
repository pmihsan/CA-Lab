	.data
msg1:	.asciiz "Enter a number\n"
msg2:	.asciiz "Fibo of the number\n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0, 1
	li $t1, 1
	li $t3, 0
	li $t4, 2
	
fibo:
	ble $s0, 0, printRes
	ble $s0, 2, printRes1
	
loop:
	beq $t4, $s0, printFinal
	
	add $t3, $t0, $t1
	move $t0, $t1
	move $t1, $t3
	
	move $t2, $t3
	addi $t4, $t4, 1
	j loop
	
	
printRes:
	li $t2, 0
	j printFinal
	
printRes1:
	li $t2, 1
	j printFinal
	

printFinal:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	j exit
	
exit:
	li $v0, 10
	syscall