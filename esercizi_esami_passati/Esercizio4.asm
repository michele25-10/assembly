#Programma che calcola il numero di uni presenti in un intero a 32 bit.
.text
	main:
	addi $s0, $zero, 0	#int i = 0
	addi $s1, $zero, 0	#int n = 0
	addi $s2, $zero, 0	#int x = 18
	addi $s3, $zero, 0	#int y = 0
	
	while:
	beq $s0, 32, end
	and $t1, $s2, 1
	add $s3, $s3, $t1
	add $s1, $s1, $s3
	srl $s2, $s2, 1
	addi $s0, $s0, 1	 
	j while
	
	end:
	addi $v0, $zero, 10
	syscall