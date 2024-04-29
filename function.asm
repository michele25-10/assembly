#int main() {
#	simple();
#	a = b + c;
#}

#void simple() {
#	return;
#}

.data
.text
# $s0 = y
main:
addi $a0, $0, 2 # argument 0 = 2
addi $a1, $0, 3 # argument 1 = 3
addi $a2, $0, 4 # argument 2 = 4
addi $a3, $0, 5 # argument 3 = 5
jal diffofsums # call Function			#Stalta ad una etichetta jal
add $s0, $v0, $0 # y = returned value

li $v0, 10
syscall

# $s0 = result
diffofsums:
add $t0, $a0, $a1 # $t0 = f + g
add $t1, $a2, $a3 # $t1 = h + i
sub $s0, $t0, $t1 # result = (f + g) - (h + i)
add $v0, $s0, $0 # put return value in $v0
jr $ra # return to caller			#Salta all'indirizzo interno ad un registro --> jr