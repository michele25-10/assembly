#Verifica dell’ordinamento di un vettore. Anche in questo caso non si devono utilizzare
#macro. Il codice non é ottimizzato, ma questo non riguarda l’esercizio.

.data
	array: .word 0, 1, 2, 7, 8, 10, 11, 15
.text
	la $s0, array	#array[8]={0,1,4,2,7,8,4,6};
	addi $s1, $zero, 0	#int i;
	addi $s2, $zero, 1	#int ord_c=1;
	addi $s3, $zero, 1	#int ord_sc=1;

	addi $t0, $zero, 28	#max

	while:
	#while (i<7)
	slt $t1, $s1, $t0
	beq $t1, $zero, end
	#array[i]
	add $t2, $s0, $s1
	lw $t3, 0($t2)
	#array[i+1]
	addi $t4, $s1, 4
	add $t2, $s0, $t4
	lw $t5, 0($t2)
	
	#if (array[i]>=array[i+1])
	slt $t1, $t5, $t3
	beq $t1, $zero, ord_sc
	addi $s2, $zero, 0	#ord_c=0;
	j increment
	ord_sc:
	addi $s3, $zero, 0 	#ord_sc=0;
	increment:
	addi $s1, $s1, 4	#i=i+1;
	j while
	  
	end:
	add $a0, $s2, $zero 
	addi $v0, $zero, 1
	syscall	
	add $a0, $s3, $zero 
	addi $v0, $zero, 1
	syscall	
	addi $v0, $zero, 10
	syscall	



