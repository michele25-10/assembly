#Scrivere un programma in linguaggio assemblativo
#8088 che, dato un numero memorizzato in memoria
#principale, calcola il fattoriale del numero (n! =
#n×(n?1)×. . .×1) e lo stampa.

.data

.text
	li $v0, 5
	syscall
	move $a0, $v0	#valore di partenza
	li $a1, 1	#valore totale

	jal fattoriale	#Chiamo funzione fattoriale(int n); 

	move $a0, $v0	#Stampa del risultato
	li $v0, 1
	syscall
	
	li $v0, 10 	#Termino programma
	syscall

	fattoriale: #int fattoriale(int n){}
	bgt $a0, 1, code_function
	move $v0, $a1	#sposto il risultato in $a1
	jr $ra
	
	code_function:
	#alloco memoria
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	mul $a1, $a1, $a0
	sub $a0, $a0, 1
	jal fattoriale	
	#dealloca memoria.
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

		
