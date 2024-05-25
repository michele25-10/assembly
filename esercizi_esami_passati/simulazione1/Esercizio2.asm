.data 
	array: .word 0,1,4,2,7,8,4,6

.text
	main:
	addi $s0, $zero, 4	#il mio indice in realtà verrà rappresentato dal numero di bit di differenze tra gli indirizzi
	lw $s1, array($zero)	#inserisco in x il primo elemento dell'array
	addi $t0, $zero, 32	#dimensione * 4
	
	while:
	beq $s0, $t0, end
	lw $t2, array($s0)	#t2 contiene array[i]
	slt $t1, $s1, $t2	#(x<array[i])  
	beq $t1, $zero, increment
	addi $s1, $t2, 0
	j increment 
	
	increment:
	addi $s0, $s0, 4
	j while
	
	end:
	addi $v0, $zero, 1
	addi $a0, $s1, 0
	syscall
	
	addi $v0, $zero,  10
	syscall
	