#Programma che calcola il valore del bit di paritá per un numero naturale in una CPU a 32
#bit. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Nota: l’operatore % ritorna
#il resto della divisione intera, questa operazione non esiste nel nostro set di istruzioni assembly,
#ma puó essere realizzata facilmente pensando alla rappresentazione binaria di numeri pari e
#dispari.

.text
	main:
	addi $s0, $zero, 16	#int x = 16
	addi $s1, $zero, 0	#int y
	addi $s2, $zero, 0	#int i 
	addi $s3, $zero, 0	#int p
	
	addi $t0, $zero, 32
	
	while:
	beq $t1, $t0, endloop
	andi $t1, $s0, 1
	add $s1, $s1, $t1	#y=y+(x & 1);
	srl $s0, $s0, 1		#x=x>>1;
	addi $s2, $s2, 1	#i=i+1;
	
	endloop:
	andi $s3, $s1, 1	#p=y%2;
	
	addi $a0, $s3, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall