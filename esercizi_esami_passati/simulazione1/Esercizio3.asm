#Funzione che calcola la distanza fra due interi.

.data

.text
	main:
	#Seguo la convenzione... zio pera!
	addi $s0, $zero, 7 	#int x = 7
	addi $s1, $zero, 4	# int y = 4
	
	addi $a0, $s0, 0 	#int x = 7
	addi $a1, $s1, 0	# int y = 4
	jal dist 		# dist(x, v)
	addi $s2, $v0, 0	# x = dist(x, y)

	addi $a0, $s2, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall	

	#funzione
	dist:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 0($sp) 
	
	slt $t1, $a1, $a0	
	beq $t1, 0, else
	sub $v0, $a1, $a0
	j return
	else:
	sub $v0, $a0, $a1
	jr $ra
	return:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
