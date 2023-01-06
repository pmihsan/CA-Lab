# Sample Program to decrement a number by 10

	.data					# Data Segment
hello:  .asciiz "Decrementing a number by 10\n"	# A Null terminated string
num:	.word	123				# An Integer				
	.text
	.globl main
	
main:
	la	$a0, hello
	li	$v0, 4
	syscall
	lw	$a1, num($zero)			# Load word num
	subi	$a3, $a1, 10			# Add Two integers
	la	$a0, ($a3)			# Load the address of the result to $a0
	li	$v0, 1				# For Printing
	syscall
	li	$v0, 10				# To Exit
	syscall
