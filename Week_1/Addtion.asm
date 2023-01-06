# Sample Program to add two numbers and store it in a register

	.data					# Data Segment
hello:  .asciiz "Addtion of two numbers\n"	# A Null terminated string
	.text 					# Code Segment
	.globl main 				# Declaring main as global
	
main:
	la	$a0, hello
	li	$v0, 4
	syscall
	li	$a1, 111			# Load word 111
	li	$a2, 13				# Load Word 13
	add	$a3, $a1, $a2			# Add Two words 111 and 13
	la	$a0, ($a3)			# Load the address of the answer to $a0
	li	$v0, 1				# To call for printing integer service
	syscall
	li	$v0, 10				# To Exit
	syscall

