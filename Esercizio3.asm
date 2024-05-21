#Scrivere un programma in linguaggio assemblativo 8088 che
#calcola la somma degli elementi di un vettore vec
#memorizzato in memoria principale. 

.data
	array: .word 10, 11, 12, 13
	size: .word 4
.text
	la $a0, array		#in  $a0 ho l'indirizzo dell'array
	la $t7, size
	lw $a1, 0($t7)

	#Funzione della somma
	jal sum_content_array
	
	#Sposto risultato in a0 e lo stampo
	move $a0, $v0
	li $v0, 1
	syscall
	
	#concludo il programma
	li $v0, 10
	syscall
	
	#funzione di somma del contenuto dell'array
	sum_content_array:		 
		li $t0, 0 	# indice di scorrimento dell'array
		li $t1, 0 	# memorizza gli elementi dell’array
		li $v0, 0	# Azzero la variabile che restituirà il totale
		loop:		#Una sorta di for
        		beq $t0, $a1, return    # Se l'indice ha raggiunto la dimensione dell'array, esci dal loop
			lw $t1, 0($a0)		#Assegno a t1 il valore della cella dell'array
			add $v0, $v0, $t1	#somma del valore dell'array al totale        
			add $a0, $a0, 4		#Incremento di 4 la posizione del puntatore
			add $t0, $t0, 1		#incremento indice
			j loop
		
		return:
		jr $ra
	
