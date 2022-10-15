.data
wm: .asciiz "Welcome to Project 1!"
t1: .asciiz "Task 1, User Input and Output\n"
t2: .asciiz "Task 2, Arithmetic Operations\n"
t3: .asciiz "Task 3, Conditions\n"
uM1: .asciiz "Enter the first number "
uM2: .asciiz "Enter the second number "
outputM: .asciiz "Outputs:\n"
a: .asciiz "Addition result: "
s: .asciiz "Subtraction result: "
m: .asciiz "Multiplication result: "
d: .asciiz "Division result: "
sameM: .asciiz "User Inputs are the same"
notSameM: .asciiz "User Inputs are not the same"
.text
main:
	la $a0,wm
	li $v0,4
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	la $a0,t1
	li $v0,4
	syscall
	la $a0,uM1
	li $v0,4
	syscall
	li $v0,5
	syscall
	la $s0, 0xFFFF0010
	sw $v0, 0($s0)
	
	la $a0,uM2
	li $v0,4
	syscall
	li $v0,5
	syscall
	la $s1, 0xFFFF0000
	sw $v0, 0($s1)
	
	la $a0,outputM
	li $v0,4
	syscall
	lw $t0,0($s0)
	lw $t1,0($s1)
	move $a0,$t0
	li $v0,1
	syscall
	la $a0,','
	li $v0,11
	syscall
	move $a0,$t1
	li $v0,1
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	la $a0,t2
	li $v0,4
	syscall
	la $a0, a
	li $v0,4
	syscall
	add $t2,$t0,$t1
	move $a0,$t2
	li $v0,1
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	la $a0,s
	li $v0,4
	syscall
	sub $t2,$t0,$t1
	move $a0,$t2
	li $v0,1
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	la $a0,m
	li $v0,4
	syscall
	mul $t2,$t0,$t1
	move $a0,$t2
	li $v0,1
	syscall
	la $a0,'\n'
	li $v0,11
	syscall
	la $a0,d
	li $v0,4
	syscall
	div $t2,$t0,$t1
	move $a0,$t2
	li $v0,1
	syscall
