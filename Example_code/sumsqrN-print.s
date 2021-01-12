/* Global data section starts */
.data

N:
    .byte  10  

sum: 
    .long                 # 4 bytes

.align 8 

message:
    .ascii "computation over\n"


/* Code section starts */

.text
square:   #expects parameter in %ebx 
   movl %ebx, %ecx
   imul %ecx, %ecx  
   ret
.global main
main:
    movl  $0, %eax        # sum <-> %eax
    mov   N@GOTPCREL(%rip), %rbx        
    movzbl  (%rbx), %ebx    # N <-> %ebx
.Lback:
    cmpl  $0, %ebx
    je .Lloopexit
    call square
    addl %ecx, %eax         # sum = sum + i*i 
    dec   %ebx 
    jmp .Lback
.Lloopexit:
    mov sum@GOTPCREL(%rip), %rbx # reuse register %rbx
    mov %eax, (%rbx)

   #printing string
    mov     $1, %rax                # system call 1 is write
    mov     $1, %rdi                # file handle 1 is stdout
    mov     message@GOTPCREL(%rip), %rsi          # address of string to output
    mov     $17, %rdx               # number of bytes
    syscall                         # invoke operating system to do the write
    ret
