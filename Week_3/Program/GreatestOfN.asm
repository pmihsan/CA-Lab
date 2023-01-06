	.data
msg1:	.asciiz "Enter n: "
msg2:	.asciiz "\nEnter a number\n"
msg3:	.asciiz "\nThe greatest number is \n"
	.text
	
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	la $s0, ($v0) # To store n
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	la $t0, ($v0)
	
	li $t1, 1 #  (iterator)
		
loop:
	
	beq $t1, $s0, stop
	addi $t1, $t1, 1
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	la $s1, ($v0)
	
	sgt $t2, $s1, $t0
	beq $t2, 1, setLarger
	
	j loop
	
setLarger:
	la $t0, ($s1)
	j loop
	
stop:
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
		