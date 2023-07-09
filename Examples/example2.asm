section .bss
	val	resb	2

section .text
	global _start
	
	_start:
		mov eax, 243
		mov ecx, 10
		mov ebx, 0
	   loop:
		mov edx, edi
		div ecx
		add edx, "0"
		mov [val + ebx], edx
		inc ebx
		cmp eax, 0
		jg loop

		mov ecx, val
		mov edx, ebx
		mov ebx, 1
		mov eax, 4
		int 80h