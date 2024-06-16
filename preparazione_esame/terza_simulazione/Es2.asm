#Funzione che esegue una shift and rotate a destra su un intero a 32 bit. Si faccia l’ipotesi
#di dover preservare tutti i registri utilizzati dalla funzione (compreso i $t).

.text
	main:
	addi $s0, $zero, 47	#int a = 47
	addi $s1, $zero, 30	#int b = 4
	addi $s2, $zero, 0 	#int v

	#v=ror(a,b);
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal ror_funct
	addi $s2, $v0, 0	#v=ror(a,b);
	
	addi $a0, $s2, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
	
	ror_funct:
	#storeword variabili $s
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)

	addi $v0, $zero, 0	#result
	addi $s0, $zero, 0	#q
	addi $s1, $zero, 32	#32 bit
	
	sub $s1, $s1, $a1	#(32-n);
	sllv $s0, $a0, $s1	#q=p << (32-n);
	srlv $a0, $a0, $a1 	#p=p>>n;
	or $v0, $a0, $s0	#result=p | q;
		
	#loadWORD variabili
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 8
	
	jr $ra			#return 