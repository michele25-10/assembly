#Programma inteso a verificare le differenze fra & ed && in C.

.text
	main:
	addi $s0, $zero, 3	#int x
	addi $s1, $zero, 1	#int y
	addi $s2, $zero, 0	#int w
	
	#if (x & y)
	and $t0, $s0, $s1
	beq $t0, $zero, else
	addi $s2, $zero, 1	#w=1;
	j end
	else:
	#if (x && y)
	beq $s0, $zero, end 
	beq $s1, $zero, end
	addi $s2, $zero, 2	#w=2;
	
	end:
	addi $v0, $zero, 10
	syscall	
