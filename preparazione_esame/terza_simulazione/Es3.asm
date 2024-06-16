#Programma che cerca un elemento in un vettore tramite ricerca binaria. Il vettore si sup-
#pone ordinato in senso crescente.

.data
	array: .word 0, 1, 2, 4, 4, 6, 7, 9

.text
	main:
	la $s0, array		#int array..
	addi $s1, $zero, 8	#int dim vettore
	addi $s2, $zero, 0	#int elemento vettore
	addi $s3, $zero, 0	#int found = -1
	addi $s4, $zero, 0	#int i 
	addi $s5, $zero, 0	#int low
	addi $s6, $zero, 0	#int up
	
	addi $t0, $zero, 2
	
	div $s4, $s1, $t0	#i=n/2;
	addi $s6, $s1, -1	#up=n-1;
	
	while:
	#while ((found<0) && (up!=low))
	slt $t1, $s3, $zero		#found < 0
	beq $s6, $s5, continue		#up!=low	
	bne $t1, $zero, endloop		#while ((found<0) && (up!=low))
	continue:
	add $s0, $s0, $s4
	lw $t2, 0($s0)
	bne $t2, $s2, else		#if (array[i]==elem)
	addi $s3, $s4, 0 		#found=i;
	j increment
	else:
	slt $t3, $s2, $t2
	beq $t3, $zero, low_condition	#if (array[i]>elem)
	addi $s6, $s4, 0		#up=i;
	j increment
	low_condition:
	addi $s5, $s4, 0		#low=i;
	increment:
	add $t3, $s5, $s6		#UP+low
	div $s4, $t3, $t0		#i=(up+low)/2;
	j while		
	
	endloop:
	addi $a0, $s3, 0
	addi $v0, $zero, 1
	syscall
	
	addi $v0, $zero, 10
	syscall
	
	
	