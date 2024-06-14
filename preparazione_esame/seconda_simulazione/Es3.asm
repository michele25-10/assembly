#Funzione che calcola un esempio di espressione. Si faccia l’ipotesi di dover preservare tutti
#i registri utilizzati dall’espressione (compreso i $t).

.text
	main:
	addi $s0, $zero, 7	#int a 
	addi $s1, $zero, 4	#int b
	addi $s2, $zero, 8	#int c
	addi $s3, $zero, 2	#int d
	addi $s4, $zero, 0	#int v
	
	add $a0, $zero, $s0
	add $a1, $zero, $s1
	add $a2, $zero, $s2
	add $a3, $zero, $s3

	jal dist		#v=dist(a,b,c,d);	
	add $s4, $zero, $v0 
	
	add $a0, $zero, $s4 
	addi $v0, $zero, 1
	syscall	
	addi $v0, $zero, 10
	syscall	

	dist:
	addi $sp, $sp, -12
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	#storewoed variabili
	
	addi $v0, $zero, 0	#int result
	
	add $s0, $a0, $a1	#a+b
	sub $s2, $a2, $a1	#c-d
	srlv $s3, $s0, $s2  	#(a+b)>>(c-d)	
		
	sllv $s1, $a1, $a3	#b<<d
	
	add $v0, $s3, $s1	#(a+b)>>(c-d)+b<<d
	
	#loadword variabili
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)

	addi $sp, $sp, 12
	jr $ra			#return
			