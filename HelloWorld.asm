#registri t per valori temporanei
#registri s per la permanenza degli stati

#stackpointer che è registro 29

#registro RA

#Gestione dei dati
.data
	#Etichetta myMsg prenderà l'indirizzo in cui è presente il mio dato
	myMsg: .asciiz "Hello, World!\n"

#Gestione del controllo
.text
	main:  
		addi 	$v0, $zero, 4	
		la 	$a0, myMsg	#load address
		syscall
	
	
	exit: 
		#termine di un programma
		li $v0, 10
		syscall
		
#l'esecuzione è di tipo sequenziale... quindi bisogna esprimere in modo esplicito il punto in cui termina il programma