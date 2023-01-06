	.data
msg1:	.asciiz "Enter a number\n"
msg2:	.asciiz "Number of SetBits\n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t2, 0
	
loop:
	ble $s0, 0, printRes
	
	addi $t2, $t2, 1
	addi $t0, $s0, -1
	and $s0, $t0, $s0
	j loop
	
	
printRes:
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
exit:
	li $v0, 10
	syscall