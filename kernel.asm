[org 0x1000]

mov ah,0x00
mov al,0x03
int 0x10

mov ah,0x0e
mov si,logo

print_logo:
lodsb
cmp al,0
je lockscreen
int 0x10
jmp print_logo

lockscreen:

mov si,lockmsg

print_lock:
lodsb
cmp al,0
je wait_key
int 0x10
jmp print_lock

wait_key:

mov ah,0
int 0x16

mov ah,0x00
mov al,0x03
int 0x10

mov si,home

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
