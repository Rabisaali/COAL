include irvine32.inc
.data
	oglist DWORD 101, 205, 310, 415, 520, 890, 567, 345, 223, 548, 221, 678, 900, 456, 245, 679
	reversedlist DWORD 16 DUP(?)
	msg BYTE "Original list: ",0
	msg2 BYTE "Reversed list: ",0

.code
	main proc
		mov ecx, lengthof oglist
		mov esi, 0
		mov edi, lengthof reversedlist-1
	L1:
		mov eax, oglist[esi*Type oglist]
		mov reversedlist[edi*type reversedlist], eax
		inc esi
		dec edi
	LOOP L1
		
		mov edx, offset msg
		call writestring
		mov ecx, lengthof oglist
		mov esi, offset oglist

	L2:
		mov eax, [esi]
		add esi, type oglist
		call writeint 
		mov al, ' '
		call writechar
	LOOP L2

		mov edx, offset msg2
		call writestring
		mov ecx, lengthof reversedlist
		mov esi, offset reversedlist

	L3:
		mov eax, [esi]
		add esi, type reversedlist
		call writeint 
		mov al, ' '
		call writechar
	LOOP L3


	exit
	main endp
	end main