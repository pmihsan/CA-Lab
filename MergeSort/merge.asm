#merge sort
.data
a1: .space 20
a2: .space 20
arr: .space 100
len: .space 4
m1: .asciiz "Enter n: "
m2: .asciiz "Enter arr: "
m3: .asciiz "Sorted arr: "
m4: .asciiz " "

.text
main:
	li $v0, 4
	la $a0, m1
	syscall
	
	li $v0, 5
	syscall
	move $a1, $v0
	
	li $v0, 4
	la $a0, m2
	syscall
	
	li $t0, 0
	move $t1, $a1
	inp_loop:
		li $v0, 5
		syscall
		sw $v0, arr($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, -1
		bgtz $t1, inp_loop

	li $a0, 0
	sw $a1, len($zero)
	addi $a1, $a1, -1
	
	jal merge_sort

	li $t0, 0
	lw $t1, len
	li $v0, 4
	la $a0, m3
	syscall
	print:
		li $v0, 1
		lw $a0, arr($t0)
		syscall	
		li $v0, 4
		la $a0, m4
		syscall
		addi $t0, $t0, 4	
		subi $t1, $t1, 1
		bgtz $t1, print
		
	li $v0, 10
	syscall
	
merge_sort:
	bge $a0, $a1, exit_mergeSort  # if l > h 
	# mid = l + h / 2
	add $a2, $a0, $a1
	div $a2, $a2, 2
	
	# mergesort()			
	addi $sp, $sp, -16
	sw $a0, ($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $ra, 12($sp)

	move $a1, $a2

	jal merge_sort	

	lw $a0, ($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, +16	
	
	addi $sp, $sp, -16
	sw $a0, ($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $ra, 12($sp)

	move $a0, $a2
	addi $a0, $a0, 1
	
	jal merge_sort

	lw $a0, ($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, +16	
	
	addi $sp, $sp, -16
	sw $a0, ($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $ra, 12($sp)

	jal merge
	
	lw $a0, ($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, +16	
	
	exit_mergeSort: 
	jr $ra

merge:
	li $t0, 0
	move $t1, $a0
	mul $t1, $t1, 4
	move $t2, $a2
	loop1:
		lw $s0, arr($t1)
		sw $s0, a1($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 4
		addi $t2, $t2, -1
		bge $t2, $a0, loop1		
	li $t0, 0
	move $t1, $a2
	addi $t1, $t1, 1
	mul $t1, $t1, 4
	move $t2, $a1
	loop2:
		lw $s0, arr($t1)
		sw $s0, a2($t0)
		addi $t0, $t0, 4
		addi $t1, $t1, 4
		addi $t2, $t2, -1
		bgt $t2, $a2, loop2
		
	li $t0, 0
	li $t1, 0
	move $t2, $a0
	mul $t2, $t2, 4
	move $t3, $a2
	move $t4, $a1
	loop3:
		lw $s0, a1($t0)
		lw $s1, a2($t1)
		blt $s0, $s1, entry_1
		sw $s1, arr($t2)
		addi $t1, $t1, 4
		addi $t2, $t2, 4	
		addi $t4, $t4, -1
		j cond1
		entry_1:
			sw $s0, arr($t2)
			addi $t0, $t0, 4
			addi $t2, $t2, 4
			addi $t3, $t3, -1
		cond1:
			bge $t3, $a0, cond2
			j loop5
			cond2:
				bgt $t4, $a2, loop3
				j loop4
				
	loop4:
		lw $s0, a1($t0)
		sw $s0, arr($t2)
		addi $t0, $t0, 4
		addi $t2, $t2, 4	
		addi $t3, $t3, -1
		bge $t3, $a0, loop4
	j exit_merge
	
	loop5:
		lw $s1, a2($t1)
		sw $s1, arr($t2)
		addi $t1, $t1, 4
		addi $t2, $t2, 4
		addi $t4, $t4, -1
		bgt $t4, $a2, loop5
	j exit_merge
	
	exit_merge:
	jr $ra






		
