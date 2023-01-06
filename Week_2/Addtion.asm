# Sample Program to add two numbers and store it in a register

	.data					# Data Segment
hello:  .asciiz "Addtion of two numbers\n"	# A Null terminated string
num1:	.word	23				# An Integer
num2:	.word	17				# An Integer
	.text
	.globl main
	
main:
	la	$a0, hello
	li	$v0, 4
	syscall
	lw	$a1, num1($zero)		# Load word num1
	lw	$a2, num2($zero)		# Load Word num2
	add	$a3, $a1, $a2			# Add Two integers
	la	$a0, ($a3)			# Load the address of the result to $a0
	li	$v0, 1				# For Printing
	syscall
	li	$v0, 10				# To Exit
	syscall

