.text
.global fib
fib: 
mov $0,%rax
mov $1,%r10


.Lback:
cmpq $0,%rdi
je .Lexit
mov %rax,%r11
add %r10,%rax
mov %r11,%r10
dec %rdi
jmp .Lback


.Lexit:
ret
