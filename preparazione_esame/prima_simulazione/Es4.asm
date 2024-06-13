# Programma che calcola il numero di uni presenti in un intero a 32 bit.

.text
	main:
	# n=i=0;
	addi $s0, $zero, 0	# int n
	addi $s1, $zero, 0	#int i 
	
	addi $s2, $zero, 39	# int x = 18
	addi $s3, $zero, 0	# int y
	
	while:
	beq $s1, 32, end	#while (i<32)
	andi $s3, $s2, 1	#y=x & 1;
	add $s0, $s0, $s3	#n=n+y;
	srl $s2, $s2, 1		#x=x>>1;
	addi $s1, $s1, 1	#i=i+1;
	j while
			
	end:
	add $a0, $zero, $s0	
	li $v0, 1
	syscall
	
	addi $v0, $zero,10
	syscall