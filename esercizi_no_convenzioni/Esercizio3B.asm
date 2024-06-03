#// Calcolo del minimo
#int min(int a[], int dim) {
	#int i;
	#int min;

	#for (i=0; i<dim; i++) {
		#if (min>a[i]) {
			#min=a[i];
		#}
	#}
	#return min;
#}

#// Main program per verificare le funzioni
#int main () {
	#int minimo;
	#int a[10] = {10,11,13,14,17,9,7,1,4,99};

	#minimo = min(a, 10);

	#printf("Il minimo dell'array è %d\n\n", minimo);
	#return 0;
#}


.data
	a: .word 10,11,13,14,17,9,7,12,4,99
	size: .word 10
.text
	la $a0, a
	la $t7, size 
	lw $a1, 0($t7)
	
	jal minimo

	move $a0, $v0	
	li $v0, 1
	syscall

	#termine programma
	li $v0, 10
	syscall
	
	minimo: 
	li $t0, 0		#indice
	li $v0, 99 		#minimo
	li $t2, 0		#variabile di appoggio
	
	loop:	#for
		ble $t0, $a1, for_code
		jr $ra
		
	for_code:
		lw $t2, 0($a0)		#salvo in t2 il valore della cella array
		bgt $v0, $t2, swap_minore 	#Controllo sul minore
		j increment
		
	swap_minore:
		move $v0, $t2	
		j increment
	
	increment:
		add $a0, $a0, 4		#incremento indizzo di memoria array
		add $t0, $t0, 1		#Incremento indice
		j loop