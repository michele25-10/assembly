#Implement the Fibonacci function in MIPS given the following C code.

.text
	main:
	addi $s0, $zero, 2	#int n
	addi $s1, $zero, 0	#risultato
	
	addi $a0, $s0, 0
	jal fib
	
	addi $s1, $v0, 0
	addi $a0, $s1, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
	
	fib:
	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $a0, 8($sp)
	sw $ra, 12($sp)
	#salvo s0, s1, ra
	#save value of s and ra
	addi $t0, $zero, 10
	slt $t1, $a0, $t0
	beq $t1, $zero, else
	addi $v0, $a0, 0
	j deallocazione
	else: 
	addi $t0, $a0, -1
	addi $a0, $t0, 0
	jal fib
	addi $s0, $v0, 0
	
	addi $t0, $a0, -2
	addi $a0, $t0, 0
	jal fib
	addi $s1, $v0, 0
	
	add $v0, $s0, $s1
	deallocazione:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $a0, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra