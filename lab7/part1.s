.global _start
.text
_start:
la s2, LIST
addi s10, zero, 0
addi s11, zero, 0

# s10 sum
# s11 indexes

#check if last value is = -1
LOOP:
    lw s3, 0(s2)
    beq s3, -1, END
    #jump to end
    add s10, s10, s3
    addi s11, s11, 1
    addi s2, s2, 1
    j LOOP
    END:
ebreak
.global LIST
.data
LIST:
.word 1, 2, 3, 5, 0xA, -1