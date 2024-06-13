# Calcolo del massimo di un vettore. Anche in questo caso non si devono utilizzare macro.

.data 
	array: .word 0, 1, 4, 2, 7, 1, 4, 6	#int array[8]={0,1,4,2,7,8,4,6};

.text
	la $s0, array	
	addi $s1, $zero, 32	#len
	addi $s2, $zero, 4	# i
	lw $s3, 0($s0)		# x=array[0];

	while_loop:
	#while (i<8)
	slt $t0, $s2, $s1
	beq $t0, $zero, end
	# if(array[i]>x)
	add $s0, $s0, 4
	lw $t1, 0($s0)
	slt $t0, $s3, $t1
	
	beq $t0, $zero, increment
	add $s3, $zero, $t1	#x=array[i];
	increment:
	addi $s2, $s2, 4
	j while_loop

	end:
	addi $a0, $s3, 0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
