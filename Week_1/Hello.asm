# Program HelloWorld

	.data    # Data Segments
hello:  .asciiz "Hello World!..\n" # Store a null terminated string in the data segment
	.text    # Code Segment
	.globl main
	
main:
	la	$a0, hello  # Load the address of the string to the $a0
	li	$v0, 4      # Specifying the system write service
	syscall		    # Call the kernel for writing the string
	li	$v0, 10     # Exit to OS
	syscall
	
