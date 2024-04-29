.data
stringa: .asciiz 
.space 5 #alloco una area di memoria di 5 byte che conterrà le stringhe
separatore: .asciiz "\n"

.text
li $v0, 8 # Carichiamo il codice della syscall in $v0
la $a0, stringa # Indirizzo del buffer
li $a1, 5 # numero di caratteri da leggere (più uno)
syscall # Invochiamo la syscall con codice 5

move $t0, $a0 # Mi salvo l'indirizzo della stringa acquisita

la $a0, separatore #stampo a capo
li $v0, 4 # stampo la stringa letta
syscall

move $a0, $t0 #stampo a capo
syscall

li $v0, 10 # syscall per terminare in modo protetto il programma
syscall