# Sample Program to subtract two numbers and store it in a register

	.data					# Data Segment
hello:  .asciiz "Subtraction of two numbers\n"	# A Null terminated string
	.text 					# Code Segment
	.globl main 				# Declaring main as global
	
main:
	la	$a0, hello
	li	$v0, 4
	syscall
	li	$s0, 20				# Load word 20
	li	$s1, 13				# Load Word 13
	sub	$t0, $s0, $s1			# Subtract Two words 20 and 13
	la	$a0, ($t0)
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
