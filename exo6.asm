.data

liste: .byte 0, 0, 0, 0, 0
min: .byte 0
max: .byte 0


.text
.globl main
.ent main
main:

la $t0, liste
li $t1, 1

lire:

li $v0, 5
syscall

sb $v0, ($t0)
add $t0, $t0, 1
add $t1, $t1, 1
bgt $t1, 5, next
b lire

next:

li $a0, 10
li $v0, 11
syscall

la $t0, liste
li $t1, 1
lb $t2, ($t0)
lb $t3, ($t0)

boucle:

add $t0, $t0, 1
add $t1, $t1, 1
lb $t4, ($t0)

blt $t4, $t2, newMin
b TryMax


newMin:
move $t2, $t4


TryMax:
bgt $t4, $t3, newMax
b iteration

newMax:
move $t3, $t4


iteration:
beq $t1, 5, out
b boucle

out:

sb $t2, min
sb $t3, max

lb $a0, min
li $v0, 1
syscall

li $a0, 10
li $v0, 11
syscall

lb $a0, max
li $v0, 1
syscall

li $v0, 10
syscall

.end main