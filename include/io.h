/*
 * io.h - routines for processing input/output
 *
 * Input can come from stdin or a file.
 * Output must be given in the same format as input so that it can be used
 * as input.
 */

#ifndef _IO_H_
#define _IO_H_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

// holds the code from input so buffers can close asap
char* text = NULL;

/*
 * int readf(char*)
 * Read a source file passed as parameter.
 *
 * Returns 0 on success, errno on error.
 */
int readf(char *filename)
{
	FILE *fp;

	int flen, rlen;

	if ((fp = fopen(filename, "r")) == NULL) {
		fprintf(stderr, "error: %s\n", strerror(errno));
		return errno;
	} else {
#ifdef DEBUG
		printf("File opened: %s\n", filename);
#endif
	}

	fseek(fp, 0, SEEK_END);
	flen = ftell(fp);
	rewind(fp);
	text = (char *) malloc(flen + 1);

	if ((rlen = fread(text, sizeof(char), flen, fp)) != flen) {
		fprintf(stderr, "error: %s\n", strerror(errno));
		return errno;
	}

	text[flen] = '\0';
#ifdef DEBUG
	printf("text: %s\n", text);
#endif
	fclose(fp);
	return 0;
}

#endif /* _IO_H_ */
