
section .bss
	sum resb 1

section .text
	global _start

	_start:
		mov eax, '4'
		sub eax, '0'
		mov ebx, '1'
		sub ebx, '0'
		add eax,ebx
		add eax, '0'
		mov [sum], eax
		mov ecx, sum
		mov edx, 1
		mov ebx, 1
		mov eax, 4
		int 80h
		
		mov eax, 1
		int 80h