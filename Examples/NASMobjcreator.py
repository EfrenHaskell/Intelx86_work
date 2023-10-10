import os

def convert_to_obj(asmfile:str, dirpath:str, nasmloc:str,isprint:bool):
    if os.chdir(nasmloc) == 1:
        raise ValueError(f"The nasm location {nasmloc} is incorrect\nEither you have inaccurately input the nasm path or nasm has not been properly installed on your device")
    if os.system(f"nasm -f elf64 {dirpath}/{asmfile}.asm") == 1:
        raise OSError(f"Conversion method failed to assemble the asmfile {asmfile}.asm\nCheck that the given path and file exist")
    if os.chdir(dirpath) == 1:
        raise OSError(f"The directory {dirpath} does not exist\nInput a valid directory")
    if os.system(("wsl ld -s -o" + " ".join([asmfile, asmfile + ".o"]))) == 1:
        raise OSError(f"Linker failed to link asmfile {asmfile}.asm with object file {asmfile}.o\n")
    if isprint:
        output = os.popen(f"wsl ./{asmfile}").readlines()
        for line in output:
            print(line)
    else:
        print(f"Object file successfully produced\nChange directory to {dirpath}\nRun the command wsl ./{asmfile}")
