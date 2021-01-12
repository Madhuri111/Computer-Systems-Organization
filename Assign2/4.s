.data
n:
 .byte 10
.text
.global main
.global fib
main:
mov n@GOTPCREL(%rip),%rbx
movq (%rbx),%rdi
mov $0,%rax
call fib
ret
