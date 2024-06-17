#Implement the Fibonacci function in MIPS given the following C code.

.text
	main:
	addi $s0, $zero, 5	#int arg
	addi $s1, $zero, 0	#risultato
	
	addi $a0, $s0, 0
	jal func
	
	addi $s1, $v0, 0
	addi $a0, $s1, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
	
	func:
	addi $sp, $sp, -8
	sw $s0, 0($sp)	
	sw $s1, 4($sp)
	
	addi $v0, $zero, 1
	addi $s0, $zero, 1
	addi $a0, $a0, 1
	for:
	slt $s1, $s0, $a0
	beq $s1, $zero, endloop
	mul $v0, $v0, $s0
	addi $s0, $s0, 1
	j for
	endloop: 
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8

	jr $ra	