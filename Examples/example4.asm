section .data
	obj	db	3
	augment	db	2
	str_obj	resb	1
	string	db	'hello'

section .text
	global _start

	start:

		mov rcx, 'abc'
		mov [str_obj], rcx
		mov rcx, str_obj
		mov rdx, 3
		mov rbx, 1
		mov rax, 4
		int 80h

		;mov r8, string
		;mov r9, ' world'
		;mov [r8+5], r9
		;mov rcx, r8
		;mov rdx, 11
		;mov rbx, 1
		;mov rax, 4
		;int 80h


		;mov rax, [obj]
		;add rax, augment
		;add rax, "0"
		;mov [str_obj], rax
		;mov rcx, str_obj
		;mov rdx, 1
		;mov rbx, 1
		;mov rax, 4
		;int 80h
	