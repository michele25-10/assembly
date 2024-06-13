.text
	main:
	addi $s0, $zero, 9	#x=7;
	addi $s1, $zero, 100	#y=4;
	
	addi $s2, $zero, 0 	#int v
	
	#v=dist(x,y);
	add $a0, $zero, $s0
	add $a1, $zero, $s1
	jal dist
	add $s2, $zero, $v0
	
	end:
	add $a0, $zero, $s2
	li $v0, 1
	syscall
	
	addi $v0, $zero,10
	syscall
	
	dist:
	#salvo le variabili $s usate dal main
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	
	addi $v0, $zero, 0	#result
	# if (a>b)
	slt $s1, $a1, $a0
	beq $s1, $zero, else
	sub $v0, $a0, $a1
	j clear_stack
	else:
	sub $v0, $a1, $a0
	clear_stack: 	#libero le variabili
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	add $sp, $sp, 8
	jr $ra
		