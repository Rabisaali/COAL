include irvine32.inc

.data
arr WORD 1234h, 3456h, 5678h
reversed WORD lengthof arr DUP(?)
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
	mov al, BYTE ptr arr[esi]
	mov bl, BYTE ptr arr[esi+1]
	xchg al, bl
	mov BYTE PTR reversed[esi], al
	mov BYTE PTR reversed[esi+1], bl
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
		movzx eax, WORD PTR [esi]
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
		movzx eax, WORD PTR [esi]
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




