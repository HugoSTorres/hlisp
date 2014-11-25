/*
 * main.c - program's entry point
 */

#include "hlisp.h"

int main(int argc, char* argv[])
{
#ifdef DEBUG
	printf("---- DEBUG MODE ----\n");
#endif

	// parse command line args
	int _infile = 0;
	int c;
	char *infilename = NULL;

	while((c = getopt(argc, argv, "f:")) > 0){
		switch(c)
		{
			case 'f':
				_infile = 1;
				infilename = optarg;
				break;
		}
	}

	// user specified an input file so open, read and close it
	if (_infile)
		readf(infilename);

	return 0;
}
