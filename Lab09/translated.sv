LB $v0 0x0044 $zero
LB $a3 0x0040 $zero
LB $v1 0x0045 $a3
OR $a0 $a3 $v0
AND $a1 $v1 $a0
ADD $a1 $a1 $a0
BEQ $a1 $a3 0x0008
SLT $a2 $v1 $a0
BEQ $a2 $zero 0x0001
LB $a1 0x0000 $zero
SLT $a2 $a3 $v0
ADD $a3 $a2 $a1
SUB $a3 $a3 $v0
J 0x000000F
LB $a3 0x0000 $zero
SB $a3 0x0047 $v0
SRA $zero $zero 0x0undefined
NOT FOUND
SYSCALL
