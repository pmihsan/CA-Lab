# Sample Program to add four numbers and store it in a register

	.data					# Data Segment
hello:  .asciiz "Addtion of four numbers\n"	# A Null terminated string
num1:	.word	5				# An Integer
num2:	.word	12				# An Integer
num3:	.word	27				# An Integer
num4:	.word	11				# An Integer
	.text
	.globl main
	
main:
	la	$a0, hello
	li	$v0, 4
	syscall
	lw	$s0, num1($zero)		# Load word num1,num2,num3,num4
	lw	$s1, num2($zero)		
	lw	$s2, num3($zero)		
	lw	$s3, num4($zero)		
	add	$t0, $s0, $s1			# Adding four integers 
	add	$t1, $t0, $s2		
	add	$t2, $t1, $s3			
	la	$a0, ($t2)			# Load the address of the result to $a0
	li	$v0, 1				# For Printing
	syscall
	li	$v0, 10				# To Exit
	syscall
