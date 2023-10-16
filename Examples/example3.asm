section .text
	global _start
	
	_start:
		mov r8, -1
	loop:	inc r8
		mov r9, val
		add r9, r8
		mov rax, 4
		mov rbx, 1
		mov rcx, r9
		mov rdx, 1
		int 80h
		mov al, [val+r8]
		cmp al, 0x00	;check if current char is null
		jnz loop

		mov rax, 1
		int 80h

section .data
	val	db	"123"