Include Irvine32.inc

.data 
off SBYTE -5, 3, -2, 7
reading SBYTE lengthof off DUP(?)
msg BYTE "Enter reading ",0
msg1 BYTE "Adjusted readings: ",0
msg2 BYTE "R (decimal) : ",0
msg3 BYTE "R (hexadecimal) : ",0
msg4 BYTE "Low word of R : ",0
msg5 BYTE "Low byte of R : ",0
R DWORD ?

.code 
main proc
mov ecx, lengthof reading
mov ebx,1
mov esi, offset reading
Input:
	mov edx, offset msg
	call writestring
	mov eax, ebx
	call writedec
	mov al, ' '
	call writechar
	inc ebx
	call readint
	mov [esi], al
	inc esi
	LOOP Input

	call crlf

	mov esi, offset reading
	mov ebx, offset off
	mov ecx, lengthof reading

Addition:
	mov al, [ebx]
	add [esi], al
	inc esi
	inc ebx
	LOOP Addition


	mov esi, offset reading
	mov ecx, lengthof reading
	mov edx, offset msg1
	call writestring

Output:
	movsx eax, BYTE PTR [esi]
	call writeint
	mov al, ' '
	call writechar
	inc esi
	LOOP Output

movsx eax, reading[1]
mov R, eax
movsx eax, reading[2]
sub R, eax
movsx eax, reading[0]
neg eax
add R, eax
movsx eax, reading[3]
add R, eax


mov edx, offset msg2
call writestring
mov eax, R
call writeint
call crlf

mov edx, offset msg3
call writestring
mov eax, R
call writehex
call crlf
mov eax, 0

mov edx, offset msg4
call writestring
;mov esi, offset R
mov ax, WORD PTR R
call writehex
call crlf

mov edx, offset msg5
call writestring
movsx eax, BYTE PTR R
call writeint


exit
main endp
end main