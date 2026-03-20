[org 0x1000]

mov ah,0x0e
mov si,msg

print:
lodsb
cmp al,0
je halt
int 0x10
jmp print

halt:
jmp $

msg db "Wendigo OS Kernel Loaded!",0
print_home:
lodsb
cmp al,0
je halt
int 0x10
jmp print_home

halt:
jmp $

logo db "WENDIGO OS",13,10,13,10,0
lockmsg db "Lock Screen - Press any key to open",13,10,0
home db "Home Screen",13,10,"[ Forest Store ]",13,10,"forest-yum-store.lovable.app",0
