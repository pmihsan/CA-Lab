	.data
txt1:	.asciiz "Enter first Number\n"
txt2:	.asciiz "Enter second number\n"
txtOp:	.asciiz "Enter OP 1.Add 2.Sub 3.Mul 4.Div 5.Mod\n"
txt3:	.asciiz "Answer is\n"
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
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, txtOp
	syscall
	
	li $v0, 5
	syscall 
	
	move $a0, $s0
	move $a1, $s1
	
	beq $v0, 1, callAdd
	beq $v0, 2, callSub
	beq $v0, 3, callMul
	beq $v0, 4, callDiv
	beq $v0, 5, callMod
	
	j exit
	
callAdd:
	jal Add
	j printAnswer

callSub:
	jal Sub
	j printAnswer
	
callMul:
	jal Mul
	j printAnswer
	
callDiv:
	jal Div
	j printAnswer
	
callMod:
	jal Mod
	j printAnswer
	
Add:
	add $v0, $a0, $a1
	jr $ra
	
Sub:
	sub $v0, $a0, $a1
	jr $ra
	
Mul:
	mul $v0, $a0, $a1
	jr $ra
Div:
	div $v0, $a0, $a1
	jr $ra
Mod:
	rem $v0, $a0, $a1
	jr $ra
printAnswer:
	move $s0, $v0
	li $v0, 4
	la $a0, txt3
	syscall
	li $v0, 1
	la $a0, ($s0)
	syscall
	j exit
exit:
	li $v0, 10
	syscall
