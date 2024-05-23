#Scrivere un programma in linguaggio assemblativo 8088 che,
#presi due dati a e b in memoria, calcola l’espressione (a+3)*b
#ponendo il risultato nel registro accumulatore.

.text
	#-------------MAIN---------------
	#leggo valore esponente
	li $v0, 5
	syscall
	
	#come argomento passo il numero
	move $a0, $v0
	jal square
	
	#stampa finale del risultato
	move $a0, $v0 #metto il risultato nella variabile incrementatore
	li $v0, 1
	syscall
	li $v0, 10 #termino programma
	syscall	
	
	#Funzione per fare il quadrato di un numero
	square:
		mul $v0, $a0, $a0 
		jr $ra
				
