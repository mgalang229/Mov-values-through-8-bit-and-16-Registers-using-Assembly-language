.model small 
                       
.data
   
   heading db 10, 13, "Transferring values from AX(AH, AL) to DX(DH, DL)$"
   message1 db 10, 13, 10, 13, "Transfer value through 8-bit registers: $"
   message2 db 10, 13, "Transfer value through 16-bit registers: $"                  
    
.code           

main proc far 
    
   mov ax, @data
   mov ds, ax
   
   lea dx, heading ; print heading
   mov ah, 09h
   int 21h 
   
   EightBitRegisters:
   
   lea dx, message1 ; print message 1
   mov ah, 09h
   int 21h           
   
   mov al, 8        ; store 8 to al
   mov bl, al       ; copy al to bl
   
   add bl, 48       ; add 48 to bl
   mov cl, bl       ; copy bl to cl
   
   mov dl, cl       ; copy cl, dl
   
   mov ah, 2h       ; print the value in dl
   int 21h          ; 8-bit register          
   
                          
   SixteenBitRegisters:
   
   lea dx, message2 ; print message 2
   mov ah, 09h
   int 21h
            
   mov ax, 9        ; store 9 to ax
   mov bx, ax       ; copy ax to bx
   
   add bx, 48       ; add 48 to bx
   mov cx, bx       ; copy bx to cx
   
   mov dx, cx       ; copy cx to dx
   
   mov ah, 02h      ; print the value in dx
   int 21h          ; 16-bit register
    
   mov ah, 4ch      ; end program
   int 21h
      
    
endp    

end main