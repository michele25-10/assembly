#Programma che calcola il prodotto di due numeri naturali in una CPU a 32 bit priva di
#moltiplicatore. L’esercizio deve essere risolto senza utilizzare macro (bge ....). Si ignorino
#eventuali problemi di overflow.

.text
	main:
	addi $s0, $zero, 1024	#int x moltiplicando
	addi $s1, $zero, 16	#int y moltiplicatore
	
	addi $s2, $zero, 0	#int p prodotto
	
	addi $t0, $zero, 0	#int i 
	addi $t1, $zero, 32	#int tmp 

	while:
	beq $t0, 32, end
	and $t1, $zero, 1
	bne $t1, $zero, if
	continue:
	srl $s1, $s1, 2
	sll $s0, $s0, 2
	addi $t0, $t0, 1
	j while

	if:
	add $s2, $s2, $s0
	j continue

	end:
	add $a0, $zero, $s2
	addi $v0, $v0, 1
	syscall 
	
	addi $v0, $zero, 10
	syscall
