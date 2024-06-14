#Programma che calcola il prodotto di due numeri naturali in una CPU a 32 bit priva di
#moltiplicatore. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Si ignorino
#eventuali problemi di overflow.

.text
	addi $s0, $zero, 16	#int x = 16
	addi $s1, $zero, 18	#int y = 18
	addi $s2, $zero, 0	# int p = 0
	addi $s3, $zero, 0	# int i = 0
	
	addi $t0, $zero, 0	#int tmp
	addi $t1, $zero, 32	#max condizione
	
	while:
	#while (i<32)
	slt $t2, $s3, $t1
	beq $t2, $zero, end
	andi $t0, $s1, 1	#tmp=y & 1;
	beq $t0, $zero, continue
	add $s2, $s2, $s0	#p=p+x;
	continue:
	srl $s1, $s1, 1		#y=y>>1;
	sll $s0, $s0, 1		#x=x<<1;
	addi $s3, $s3, 1	#i=i+1;
	j while
		
	end:
	add $a0, $s2, $zero 
	addi $v0, $zero, 1
	syscall	
	addi $v0, $zero, 10
	syscall	