.data
array: .word 10,5,2
.text
	li $t0, 0
	lw $s0, array($t0)
	add $t0, $t0, 4
	
	lw $s1, array($t0)
	add $t0, $t0, 4
	
	lw $s2, array($t0)

sort:		
	sgt $t0, $s0, $s1
	beq $t0, 1, swap1
	
	sgt $t0, $s1, $s2
	beq $t0, 1, swap2
	
	sgt $t0, $s0, $s1
	beq $t0, 1, swap1
	
	j done
	
swap1:
	add $t1, $zero, $s0
	add $s0, $zero, $s1
	add $s1, $zero, $t1
	j sort
	
swap2:
	add $t1, $zero, $s1
	add $s1, $zero, $s2
	add $s2, $zero, $t1
	j sort
		
done:
	li $v0, 1
	la $a0, ($s0)
	syscall
	
	la $a0, ($s1)
	syscall
	
	la $a0, ($s2)
	syscall
	
	li $v0, 10
	syscall
