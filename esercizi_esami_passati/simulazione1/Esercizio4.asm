#Programma che calcola il numero di uni presenti in un intero a 32 bit.
#Non posso usare MACRO
.text
	main:
	addi $s0 $zero, 31	#int x = 18
	addi $s1, $zero, 0	#int y
	addi $s2, $zero, 0	#int n
	addi $s3, $zero, 0	#int i
	
	addi $t0, $zero,  32	
	
	while:
	beq $s3, $t0, end	#non posso usare macro quindi inserisco 32 in una variabile temporanea
	andi $t1, $s0, 1
	add $s2, $s2, $t1
	srl $s0, $s0, 1
	addi $s3, $s3, 1
	j while
	
	end:
	#Stampa e close program
	addi $a0, $s2, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
