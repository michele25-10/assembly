
#associo ad un registro una etichettta
.data 
a: .word

.text
	#lettura in input e salvataggione nel registro v0 il valore di ritorno
	la $v0, 5
	syscall
	
	# salvataggio del dato preso in input nel campo t0
	add $t0, $zero, $v0
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	#termine del programma 
	li $v0, 10
	syscall