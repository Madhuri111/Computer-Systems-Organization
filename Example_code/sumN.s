/* Global data section starts */
.data

N:
    .byte  10  

sum: 
    .long                 # 4 bytes

/* Code section starts */

.text
.global main
main:
    movl  $0, %eax        # sum <-> %eax
    mov   N@GOTPCREL(%rip), %rbx        
    movzbl  (%rbx), %ebx    # N <-> %ebx
.Lback:
    cmpl  $0, %ebx
    je .Lloopexit
    addl %ebx, %eax         # sum = sum + i 
    dec   %ebx 
    jmp .Lback
.Lloopexit:
    ret
