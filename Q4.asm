include irvine32.inc

.data
ogID DWORD 101, 102, 103, 104, 105, 106, 107, 108, 109, 110
new DWORD 10 DUP(?)
msg BYTE "Original ID: ",0
msg2 BYTE "New: ",0

.code
main PROC
mov ecx, lengthof ogID
dec ecx
dec ecx
mov esi, 0
mov edi, offset new
add edi, 2*type new

L1:
	mov eax, ogID[esi*Type ogID]
	mov [edi], eax
	add edi, type new
	inc esi
LOOP L1

	mov edi, offset new
	mov eax, ogID[esi*Type ogID]
	mov Dword PTR [edi], eax
	add edi, type new
	inc esi
	mov eax, ogID[esi*Type ogID]
	mov [edi], eax
	
	mov edx, offset msg
	call writeString
	mov ecx, lengthof ogID
	mov esi, offset ogID

L2:
	mov eax, Dword PTR [esi]
	call writeint
	mov al, ' '
	call writechar
	add esi, type ogID
LOOP L2

	call crlf

mov edx, offset msg2
	call writeString
	mov ecx, lengthof new
	mov esi, offset new


L3:
	mov eax, Dword PTR [esi]
	call writeint
	mov al, ' '
	call writechar
	add esi, type new
LOOP L3

exit
main ENDP
END main




