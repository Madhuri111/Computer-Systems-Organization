.data
a:
   .long 1,2,3,4,5,6,7,8,9,10

.text
.global main
main:
mov a@GOTPCREL(%rip),%r10d

mov $0,%edx
mov $0,%r12d
mov $10,%rcx
.Ls:
cmp $0,%rcx
je .Lexit
addl (%r10d),%edx
cmp (%r10d),%r12d
cmovs (%r10d),%r12d
add $4,%r10d
dec %rcx
jmp .Ls

.Lexit:
ret
