	.data
myArray:.space 12
msg:	.asciiz "\n"
	.text
	
	 li $s0, 4
	 li $s1, 10
	 li $s2, 12
	 
	 li $t0, 0
	  
	 sw $s0, myArray($t0)
	 addi $t0, $t0, 4
	   
	 sw $s1, myArray($t0)
	 addi $t0, $t0, 4
	 
	 sw $s2, myArray($t0)
	 
	 #lw $t0, myArray($zero)
	 #li $v0, 1
	 #la $a0, ($t0)
	 #syscall
	 li $t0, 0
	 
while:
	beq $t0, 12, exit
	lw  $t6, myArray($t0)
	addi $t0, $t0, 4
	li $v0, 1
	la $a0, ($t6)
	syscall
	li $v0, 4
	la $a0, msg
	syscall
	j while
	 
exit:
	 li $v0, 10
	 syscall	 

