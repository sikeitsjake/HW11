Author: Jacob Folderauer
Date: 05/15/2025
Affiliation: UMBC CMSC 313 Dr. Kidd
Section: 0830
Description: This program will take bytes of data given in the input buffer, translate them to their ASCII hex values, and then print out those values.
Compiling, Linking, and Running: To compile, link, and run this program do the following:
1. **COMPILE:** nasm -f elf32 -g -F dwarf -o translate2Ascii.o translate2Ascii.asm
2. **LINK:** ld -m elf_i386 -o translate2Ascii translate2Ascii.o
3. **RUN:** ./translate2Ascii
