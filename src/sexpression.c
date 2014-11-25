#include <stdio.h>

#include "sexpression.h"

/*
 * Parse a number into a value used by the interpreter
 */
int number(char *code)
{
	/*
	 * Determine the sign of the number.
	 * If there's no sign, the number is positive.
	 * The grammar doesn't define floating point numbers.
	 */

	 /*
	  * Convert the number from char* input to an actual integer type.
	  */

	return 0;
}

/*
 * Parse an alphanumeric string.
 */
int alpha(char *code)
{
	/*
	 * Make sure input conforms to grammar rules for alphanumerics.
	 */

	 return 0;
}

/*
 * Take an atom and determine whether it's a char or a number.
 */
 int atom(char *code)
 {
 	//isalpha() and isdigit() can be used here
 #ifdef DEBUG
 	printf("atom: parsing %s\n", code);
 #endif

 	return 0;
 }

/*
 * Take sequence and break it down into s expressions
 */
int sequence(char *code)
{
	// if the first character isn't a parenthesis, it's already wrong

	/*
	 * If the next character is a closing parentheses, we have nil.
	 * Else, we have an s expression. Put it on the stack to be evaluated,
	 *   and repeat.
	 */

	 return 0;
}

/*
 * Take s expression and determine whether it's an atom or a sequence
 */
int sexpression(char *code)
{

	return 0;
}
