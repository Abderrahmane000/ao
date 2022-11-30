.data

Vect: .byte 0, 0, 0, 0, 0
som: .word 0

.text
.globl main
.ent main
main:

li $t0 , 1
la $t1, Vect

lecture:
li $v0, 5
syscall
sw $v0, ($t1)
add $t1, $t1, 4
add $t0, $t0, 1
bgt $t0, 5, next
b lecture

next:
li $a0, 10
li $v0, 11
syscall

la $t0, Vect
li $t1, 1
li $t2, 0

boucle:
lw $t3, ($t0)
add $t2, $t2, $t3
add $t0, $t0, 4
add $t1, $t1, 1
bgt $t1, 5, suite
b boucle

suite:
sw $t2, som

li $a0, 10
li $v0, 11
syscall

lw $a0, som
li $v0, 1
syscall

li $v0, 10
syscall

.end main



