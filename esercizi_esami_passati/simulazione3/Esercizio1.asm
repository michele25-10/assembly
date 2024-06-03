#Programma che calcola il valore del bit di paritá per un numero naturale in una CPU a 32
#bit. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Nota: l’operatore % ritorna
#il resto della divisione intera, questa operazione non esiste nel nostro set di istruzioni assembly,
#ma puó essere realizzata facilmente pensando alla rappresentazione binaria di numeri pari e
#dispari.

.text
	main:
	
	
	end:
	#Stampa e close program
	#addi $a0, $s2, 0
	#addi $v0, $zero, 1
	#syscall
	
	addi $v0, $zero, 10
	syscall
	