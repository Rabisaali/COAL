include irvine32.inc

.data
arr DWORD 12345678h, 34567812h, 56781234h
reversed DWORD lengthof arr DUP(?)
sep BYTE lengthof arr DUP(?)
msg BYTE "original: ",0
msg2 BYTE "swapped: ",0
msg3 BYTE "code: ",0

.code 
main proc
mov ecx, lengthof arr
mov esi, 0
mov edi, 0

L1:
	mov ax, WORD ptr arr[esi]
	mov bx, WORD ptr arr[esi+2]
	xchg ax, bx
	mov WORD PTR reversed[esi], ax
	mov WORD PTR reversed[esi+2], bx
	mov eax, 0
	mov al, BYTE ptr arr[esi]
	mov sep[edi], al
	inc edi
	add esi, TYPE arr
	LOOP jump
	jmp done

jump:
	jmp L1

done:
	
	mov edx, offset msg
	call writestring

	mov ecx, lengthof arr
	mov esi, offset arr

	L2:
		mov eax, [esi]
		add esi, type arr
		call writehex
		mov al, ' '
		call writechar
		loop L2

	mov edx, offset msg2
	call writestring

	mov ecx, lengthof reversed
	mov esi, offset reversed

	L3:
		mov eax, [esi]
		add esi, type reversed
		call writehex
		mov al, ' '
		call writechar
		loop L3

	mov edx, offset msg3
	call writestring

	mov ecx, lengthof sep
	mov esi, offset sep

	L4:
		movzx eax, BYTE PTR [esi]
		add esi, type sep
		call writehex
		mov al, ' '
		call writechar
		loop L4
exit
main endp
end main




