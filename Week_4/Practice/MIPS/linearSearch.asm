	.data
arr:	.space 48
#check:	.word 3
ent:	.asciiz "Enter the size of the array\n"
ele:	.asciiz "Enter an element\n"
msg:	.asciiz "Enter an element to search\n"
msg1:	.asciiz "Element not found\n"
msg2:	.asciiz "Element found\n"
	.text
		
main:	
	li $t0, 0 # To iterate through size
	li $t1, 1 # To iterate through count
	#li $s0, 4 # Size of array
	#lw $s1, check
	
	li $v0, 4
	la $a0, ent
	syscall
	
	li $v0, 5
	syscall
	la $s0, ($v0)
	
	j getArray
	
getArray:

	bgt $t1, $s0, getInputs
	li $v0, 4
	la $a0, ele
	syscall
	
	li $v0, 5
	syscall
	la $t7, ($v0)
	
	sw $t7, arr($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, 1

	j getArray
	
getInputs:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	la $s1, ($v0)
	
	li $t0, 0 # To iterate through size
	li $t1, 1 # To iterate through count
	
	j loop
	
loop:

	bgt $t1, $s0, printNotFound
	
	lw $s2, arr($t0)
	
	beq $s2, $s1, printFound
	addi $t0, $t0, 4
	addi $t1,$t1, 1
	
	j loop
	
printFound:

	li $v0, 4
	la $a0, msg2
	syscall
	
	j exit
	
printNotFound:

	li $v0, 4
	la $a0, msg1
	syscall
	
	j exit
	
exit:	
	li $v0, 10
	syscall
	
	
