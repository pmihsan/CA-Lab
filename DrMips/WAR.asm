addi $sp, $sp, -4

li $s1, 2

addi $s1, $s1, 21
sw $s1, 0($sp)

lw $s1, 0($sp)

addi $sp, $sp, 4