[org 0x1000]

mov ah, 0x0e
mov si, msg

print:
lodsb
cmp al,0
je halt
int 0x10
jmp print

halt:
jmp $

msg db "Welcome to Wendigo OS!",0