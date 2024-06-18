.data
stringa: .asciiz "Il minimo dell'array è "
spazi: .asciiz "\n\n"
array: .word 10,11,13,14,17,9,7,5,4,99
size: .word 40

.text
	main:
	addi $s0, $zero, 0	#int minimo
	
	#minimo = min(a, 10);
	lw $a1, size
	la $a0, array
	jal min
	addi $s0, $v0, 0
	
	la $a0, stringa
	addi $v0, $zero, 4
	syscall
	
	addi $a0, $s0, 0
	addi $v0, $zero, 1
	syscall
	
	la $a0, spazi
	addi $v0, $zero, 4
	syscall
	
	addi $v0, $zero, 10
	syscall	
	
	min:
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	lw $v0, array	#int min;
	addi $t0, $zero, 0	#int i 
	for:	#for (i=0; i<dim; i++) {
	beq $t0, $a1, endloop	
	lw $t1, array($t0)
	slt $t2, $t1, $v0
	beq $t2, $zero, increment	#if (min>a[i]) {
	addi $v0, $t2, 0 
	increment:
	addi $t0, $t0, 4
	j for
	endloop:
	#load delle variabili dalla memoria
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
	
	