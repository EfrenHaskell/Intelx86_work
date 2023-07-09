# Some small x86 learning examples:

## example.asm focuses on 3 basic implementations in Intelx86
 1. A digit can be converted from char to int and int to char using the sub and add operations
    - If a digit initially has the attribute of a text element, it can be treated as an arithmetic-operable digit through the simple operation sub \[digit\], '0'
    - Conversely, if we want to make the digit text-operable again, we can simply use the operation add \[digit\], '0'
    - In this example, I use 32-bit series registers, prefixed with 'e' - in retrospect it would have been more memory conscious to use 8-bit registers
 2. A reserved bit can be used to store non-initialized data
    - In this case, a single bit is reserved and then a value of that reserved bit is assigned via the mov operation mov \[resb\], digit
    - The square brackets here imply that we are working with the value of the resb rather than the address of the resb
    - If we want to operate on the location of the resb, we can simply work on resb without the brackets
 3. An arithmetic-operable digit can not be immediately printed
    - To print an integer, for example, we need to convert that integer into a string as the c-operation written for most if not all operating systems' sys-write calls take a string as a parameter
    - Special registers allocate parameters to system calls which can then be called by the int 80h interrupt \(the interrupt can be reference in non-hex as well\)
    -  mov eax, 4 -> specifies sys_write
    -  mov ebx, 1 -> specifies sys_out
    -  mov ecx, \[thing to be printed\] -> specifies what data is being printed
    -  mov edx, \[size\] -> specifies the size of data being printed
