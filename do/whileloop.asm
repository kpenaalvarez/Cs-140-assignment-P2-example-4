# Title:	lab  A P2		Filename: whileloop.asm
# Author: 	Kevin Peña	Date: 5/6/25
# Description:
# Input:
# Output:
################# Data segment #####################
.data
num: .word 5, 10, 15, 20
total: .word 0
N: .word 4

################# Code segment #####################
.text
.globl main

main:

    li $t1, 0   #total=0 is stores in $t1
    li $t3, 0   # i=0 is stored in $t3

    la $t2, N   #loads address of N
    lw $t4, 0($t2)  #loads N into $t2

    la $t0, num  #loads address of $t0 into num

loop:

    bge $t3, $t4, done           # If i >= N, exit loop

    # Load num[i] into $t4
    mul $t5, $t3, 4              # Multiply i by 4 (offset in bytes)
    add $t6, $t0, $t5            # Add offset to the base address of num[] to get num[i]
    lw  $t4, 0($t6)              # Load num[i] into $t4

    # Add num[i] to total
    add $t1, $t1, $t4            # total += num[i]

    # Increment i
    addi $t3, $t3, 1             # i += 1

    # Repeat the loop
    j loop

done:
    # Store sum in memory
    la  $t7, total               # Load address of total
    sw  $t1, 0($t7)              # Store total in memory

    # Print the sum (using syscall)
    li  $v0, 1                   # Print integer syscall
    move $a0, $t1                # Move total into $a0 for printing
    syscall


