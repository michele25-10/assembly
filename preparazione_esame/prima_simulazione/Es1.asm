#Programma che calcola il massimo fra 3 interi. L’esercizio deve essere risolto senza utiliz-
#zare macro (bge ....).

.text
	addi $s0, $zero, 4	#int a =4
	addi $s1, $zero, 1	#int b = 10
	addi $s2, $zero, 2	#int c = 8
	add $s3, $zero, $s2	#int x = c
	
	# if ((a>b) && (a>c))
	slt $t0, $s1, $s0
	slt $t1, $s2, $s0
	and $t2, $t0, $t1	
	beq $t2, $zero, Else_Codition
	add $s3, $zero, $s0 	# x=a;
	j End
	
	Else_Codition:
	#if (b>c)
	slt $t0, $s2, $s1
	beq $t0, $zero, End
	add $s3, $zero, $s1 	# x=b;
	
	End:
	add $a0, $zero, $s3
	addi $v0, $zero, 1 	
	syscall
	
	addi $v0, $zero, 10
	syscall
	