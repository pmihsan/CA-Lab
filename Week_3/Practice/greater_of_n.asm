.data
#array: .word 5,10,2,7,9,44
array: .word 2,4,5,6,7,9
.text
	li $s2, 6
	addi $t1, $zero, 0
	li $t2, 0
	
	lw $s4, array($t2)
	addi $t2, $t2, 4
loop:
	addi $t1, $t1, 1
	beq $t1, $s2, done
	
	lw $s3, array($t2)
	addi $t2, $t2, 4
	
	sgt $t4, $s3, $s4
	beq $t4, 1, load	

	j loop
	
load: 
	la $s4, ($s3)
	j loop
	
done:
	li $v0, 1
	la $a0, ($s4)
	syscall
	
	li $v0, 10
	syscall
