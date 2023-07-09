section .data
	val	db	"132"

section .text
	global _start
	
	_start:
		mov r8, 0
	loop:
		mov rax, val
		add rax, r8
		add rax, "0"
		mov rcx, rax
		mov rdx, 1
		mov rbx, 1
		mov rax, 4
		int 80h
		inc r8
		cmp r8,3
		jl loop