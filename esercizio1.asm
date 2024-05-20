#Scrivere un programma in linguaggio assemblativo 8088 che,
#presi due dati a e b in memoria, calcola l’espressione (a+3)*b
#ponendo il risultato nel registro accumulatore.

.text
	#-------------MAIN---------------
	#leggo in input il primo valore
	li $v0, 5
	syscall
	move $t0, $v0
	
	#leggo in input il secondo valore
	li $v0, 5
	syscall
	move $t1, $v0
	
	#controllo se il secondo valore è uguale a 0 allora risultato è uguale a 0
	beq $t1, 0, azzero
		
	#Faccio la prima somma 
	addi $t0, $t0, 3
	li $t7, 1
	
	loop:	
	add $t2, $t2, $t0  
	beq $t7, $t1, stampa 
	addi $t7, $t7, 1 #incremento vaariabile contatore
	j loop
	
	#azzero il valore (numero moltiplicato * 0) 
	azzero:
	li $t2, 0
	j stampa
	
	#stampa finale del risultato
	stampa: 
	li $v0, 1
	move $t7, $t2 #metto il risultato nella variabile incrementatore
	move $a0, $t2
	syscall
	li $v0, 10 #termino programma
	syscall	
	