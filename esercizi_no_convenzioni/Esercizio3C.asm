#Determinare se due array sono uguali

.data
	vet1: .word 10, 11, 12, 15
	vet2: .word 10, 11, 12, 15
	size: .word 4
	true: .asciiz "I due vettori sono uguali"
	false: .asciiz "I due vettori sono diversi"	
.text
	la $a0, vet1
	la $a1, vet2
	la $t0, size
	lw $a2, 0($t0)
	
	jal control_equal
	
	beq $v0, 1, write_true
	j write_false
	
	#----------------FUNCTION CONTROL---------------#
	control_equal:
	li $t0, 0 	#initial offset
	li $t1, 0	#max offset
	li $t2, 0	#contiene valore vet1
	li $t3, 0	#contiene valore vet2
	
	addi $t1, $a2, -1
	mul $t1, $t1, 4
	
	loop:
	bgt $t0, $t1, exit
	lw $t2, 0($a0)		#estrapolo valore in cella vet1
	lw $t3, 0($a1)		#estrapolo valore in cella vet2 
	bne $t2, $t3, not_equal 	#Non sono uguali i valori quindi faccio un return 
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	addi $t0, $t0, 4
	j loop

	not_equal:
	li $v0, 0	#return false
	jr $ra
	
	exit: 
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