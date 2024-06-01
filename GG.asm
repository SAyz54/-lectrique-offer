section .text
    global _start

_start:
    ; Open file descriptor for controlling electrical appliances
    mov eax, 5          ; sys_open system call number
    mov ebx, switch_path   ; address of switch path string
    mov ecx, 0          ; open for reading
    int 0x80            ; invoke syscall

    ; Error handling
    cmp eax, 0xFFFFFFFF ; check if file descriptor is valid
    je exit             ; if not, exit

    ; Write command to turn off electricity
    mov eax, 4          ; sys_write system call number
    mov ebx, eax        ; file descriptor (stdout)
    mov ecx, off_command   ; address of command to turn off
    mov edx, off_length    ; length of command
    int 0x80            ; invoke syscall

    ; Close file descriptor
    mov eax, 6          ; sys_close system call number
    int 0x80            ; invoke syscall

exit:
    ; Exit program
    mov eax, 1          ; sys_exit system call number
    xor ebx, ebx        ; return 0 status
    int 0x80            ; invoke syscall

section .data
    switch_path db "/dev/electric_switch", 0
    off_command db "turn_off", 0
    off_length equ $ - off_command