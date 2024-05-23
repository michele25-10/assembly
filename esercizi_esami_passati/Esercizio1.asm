#Programma che calcola il massimo fra 3 interi. L’esercizio deve essere risolto senza utiliz-
#zare macro (bge ....).


.text 
	main:
	addi $s0, $s0, 4	#int a
	addi $s1, $s1, 10	#int b
	addi $s2, $s2, 8	#int c
	
	addi $s3, $s2, 0	#inc x = c ///massimo
	
	#non posso usare macro quindi poosso usare solamente: bne beq
	slt $t0, $s1, $s0	#Se b<a t0 conterrà 1 altrimenti 0
	slt $t1, $s2, $s0	# Se c<a t1 conterrà 1 altrimenti 0
	
	and $t2, $t0, $t1	#eseguo la and logica if(b<a && c<a)
	bne $t2, $zero, max_is_a
	
	slt $t3, $s2, $s1
	beq $t3, $zero, end
	addi $s3, $s1, 0	# x = b
	j end	
	
	max_is_a:
	addi $s3, $s0, 0
		
	end: 
	#....stampa...
	li $v0, 10
	syscall
	
	