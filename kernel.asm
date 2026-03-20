[org 0x1000]

mov ah,0x0e
mov si,logo

print_logo:
lodsb
cmp al,0
je next
int 0x10
jmp print_logo

next:

mov si,msg

print_msg:
lodsb
cmp al,0
je halt
int 0x10
jmp print_msg

halt:
jmp $

logo db 13,10
db "      WENDIGO OS",13,10
db "       ( 0 0 )",13,10
db "      /  ---  \",13,10
db "     /  WOLF   \",13,10
db "      ---------",13,10,13,10,0

msg db "Boot complete. Press restart to continue.",0
halt:
jmp $

msg db "Wendigo OS Starting...",0

logo_data:
incbin "logo.raw"
