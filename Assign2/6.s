.data
array:
   .long 11,3,44,11,9
Sum:
 .long 0
max:
 .long 0

.text
.global main
main:
mov array@GOTPCREL(%rip),%r11
movl (%r11),%ebx

mov $5,%rax
mov $0,%edx
mov $0,%r12d
.Lsumm:
cmp $0,%rax
je .Lloopexit
addl (%r11),%edx
cmp (%r11),%r12d
cmovs (%r11),%r12d
add $4,%r11
dec %rax
jmp .Lsumm

.Lloopexit:
ret
