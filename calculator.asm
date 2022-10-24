# make a calc and handle errors and prompt to enter new values or keep the same with different operations 
.data
welcome: .asciiz "Welcome to a mips calculator\n"
input1: .asciiz "Enter the first input "
input2: .asciiz "Enter the second input "
operations: .asciiz "Choose one\n+\n-\n*\n/\ne(exit)"
errorMSG: .asciiz "\nERROR INVALID INPUT\n"
result: .asciiz "\nOutput is "
askU: .asciiz "n(new values)\ns(same values) "
.text

main:
    la $a0, welcome
    li $v0, 4
    syscall
    la $a0, '\n'
    li $v0, 11
    syscall
    la $a0, input1
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s0,$v0
    la $a0,'\n'
    li $v0,11
    syscall
    la $a0, input2
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s1,$v0
promptOp:
    la $a0, operations
    li $v0,4
    syscall
    li $v0,12
    syscall
    move $s2,$v0

    beq $s2,'+',ADD 
    beq $s2,'-', SUB
    beq $s2,'*',MUL 
    beq $s2,'/',DIV 
    beq $s2,'e',exit

    la $a0,errorMSG
    li $v0,4
    syscall
    jal main

ADD:
    la $a0,result
    li $v0,4
    syscall
    add $t0,$s0,$s1
    move $a0,$t0
    li $v0,1
    syscall
    la $a0,'\n'
    li $v0,11
    syscall
    jal promptVals
SUB:
    la $a0,result
    li $v0,4
    syscall
    sub $t1,$s0,$s1
    move $a0,$t1
    li $v0,1
    syscall
    la $a0,'\n'
    li $v0,11
    syscall
    jal promptVals

MUL:
    la $a0,result
    li $v0,4
    syscall
    mul $t2,$s0,$s1
    move $a0,$t2
    li $v0,1
    syscall
    la $a0,'\n'
    li $v0,11
    syscall
    jal promptVals
DIV:
    la $a0,result
    li $v0,4
    syscall
    div $t3,$s0,$s1
    move $a0,$t3
    li $v0,1
    syscall
    la $a0,'\n'
    li $v0,11
    syscall
    jal promptVals

promptVals:
    la $a0,askU
    li $v0,4
    syscall
    li $v0,12
    syscall
    move $s3,$v0
    beq $s3,'s',promptOp
    beq $s3,'n',main
    jal exit

exit:
    li $v0, 10
    syscall
    
