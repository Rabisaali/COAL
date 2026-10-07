include irvine32.inc

.data
wordStr BYTE "ASSEMBLY",0
codes DWORD lengthof wordStr-1 DUP(?)
msg BYTE "Array Properties ",0
msg1 BYTE "ElementSize ",0
msg2 BYTE "ElementCount ",0
msg3 BYTE "TotalSize ",0
msg4 BYTE "wordStr ",0
msg5 BYTE "codes ",0
msg6 BYTE"Sum ",0
msg7 BYTE "Staircase ",0
msg8 BYTE "Lowercase ",0


.code 
main proc
mov edx, offset msg
call writestring
mov al, ' '
call writechar
mov edx, offset msg1
call writestring
mov al, ' '
call writechar
mov edx, offset msg2
call writestring
mov al, ' '
call writechar
mov edx, offset msg3
call writestring
mov al, ' '
call writechar

call crlf

mov edx, offset msg4
call writestring
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, TYPE wordStr
call writedec
mov al, ' '
call writechar
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, lengthof wordStr
call writedec
mov al, ' '
call writechar
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, sizeof wordStr
call writedec
call crlf


mov edx, offset msg5
call writestring
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, TYPE codes
call writedec
mov al, ' '
call writechar
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, lengthof codes
call writedec
mov al, ' '
call writechar
mov al, ' '
call writechar
mov al, ' '
call writechar
mov eax, sizeof codes
call writedec
call crlf


mov edx, offset msg7
call writestring
call crlf
mov ecx, lengthof wordStr-1
mov edx, 1

Outer:
	mov ebx, ecx
	mov esi, offset wordStr
	mov ecx, edx
Inner:
	mov eax, [esi]
	call writechar
	inc esi
	LOOP Inner
	inc edx

	call crlf
	mov ecx, ebx

	LOOP Outer

mov edx, offset msg5
call writestring

mov esi, offset codes
mov edx, offset wordStr
mov ecx, lengthof codes
mov ebx, 0

L1:
	movzx eax, BYTE PTR [edx]
	mov [esi], al
	call writeint
	add ebx, [esi]
	inc edx
	add esi, TYPE codes
	LOOP L1


mov edx, offset msg6
call writestring
mov eax, ebx
call writedec




mov edx, offset msg8
call writestring
mov esi, offset wordStr
mov ecx, lengthof wordStr-1

L2:
	mov al, [esi]
	add al, 32
	mov [esi], al
	inc esi
	LOOP L2


mov edx, offset wordStr
call writestring

exit
main endp
end main
