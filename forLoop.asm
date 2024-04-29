#int main()
#{
#	for (int i=0; i<10; i++)
#	printf("%d", i);
#	return 0;
#}

.data

.text
Main:
li $t0, 0 # i in $t0
li $v0, 1		#Setto la syscall alla stampa di un intero una sola volta anzichè settarlo n volte all'interno di un for

Forloop:
beq $t0, 10, Exitloop	#Se t0 è maggiore o uguale a 10 termino il programma
#li $v0, 1		
move $a0, $t0		#setto il contenuto di $t0 dentro ad $a0
syscall			#Chiamo la syscall --> Stampo
addi $t0, $t0, 1	#incremento di uno t0

j Forloop		#Jump to forLoop.... salto all'etichetta ForLoop

Exitloop:			
li $v0, 10		#Syscall per terminare il programma
syscall