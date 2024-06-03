#Dato un numero in input, determina se quel numero è un numero primo oppure no

.data
	true: .asciiz "E' un numero primo"
	false: .asciiz "Non è un numero primo"

.text
	li $v0, 5
	syscall
	move $a0, $v0	#valore numero

	jal numero_primo	#Chiamo funzione numero_primo(int n); 

	beq $v0, 1, write_true
	j write_false
	
	#------------FUNCTION NUMERO PRIMO--------------#

	numero_primo:
	li $t0, 0
	divu $t0, $a0, 2
	loop:
	    beq $t0, 1, is_primo
	    div $a0, $t0
	    # Il quoziente è in $lo e il resto è in $hi
	    mfhi $t1 	#salvo $t1 il resto della divisione
	    beq $t1, 0,	not_primo
	    sub $t0, $t0, 1
	    j loop
	    
	not_primo:
	li $v0, 0	#return false
	jr $ra

	is_primo:
	li $v0, 1	#return true
	jr $ra
	
	#-----------------------------------------------#
	
	#--------------OUTPUT---------------------------#
	write_true: 
	la $a0, true	#Stampo che il numero è primo
	li $v0, 4
	syscall
	j close_program	#Faccio terminare il programma
	
	write_false:
	la $a0, false 	#Stampo che il numero non è primo
	li $v0, 4
	syscall
	j close_program #Termino il programma
	
	#----------------------------------------------#
	close_program:	
	li $v0, 10 	#Termino programma
	syscall