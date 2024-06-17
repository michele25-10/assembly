#Programma che calcola il valore del bit di paritá per un numero naturale in una CPU a 32
#bit. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Nota: l’operatore % ritorna
#il resto della divisione intera, questa operazione non esiste nel nostro set di istruzioni assembly,
#ma puó essere realizzata facilmente pensando alla rappresentazione binaria di numeri pari e
#dispari.

.text
	main:
	addi $s0, $zero, 21	#int x = 16
	addi $s1, $zero, 0	#int y = 0
	addi $s2, $zero, 0	#int i = 0
	addi $s3, $zero, 0	#int p = 0
	
	addi $t0, $zero, 32
	
	while:
	beq $s2, $t0, endloop
	andi $t1, $s0, 1
	add $s1, $s1, $t1
	srl $s0, $s0, 1
	addi $s2, $s2, 1
	j while
	
	endloop:
	andi $s3, $s1, 1
	addi $a0, $s3, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall

