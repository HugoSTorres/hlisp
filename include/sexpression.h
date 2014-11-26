/*
 * All the following rules are defined according to the EBNF grammar rules as
 * part of the project requirements.
 *
 * <letter> => a | b | ... | z | A | B | ... | Z | $ | _
 * <digit>  => 0 | 1 | ... | 9
 * <blank>  => blank space or character
 * <number> => [ + | - ] <digit> { <digit> }
 * <alpha>  => { <letter> | <digit> } <letter> { <letter> | <digit> }
 * <atom>   => <alpha> | <number>
 * <sequence> => ( <s-expression> { <blank> { <blank> } <s-expression> }) | ()
 * <s-expression> => <atom> | <sequence>
 *
 * In a recursive descent parser, every non-terminal gets a function.
 * Letter, digit and blank are terminals, so they don't get functions.
 */

#ifndef _SEXP_H_
#define _SEXP_H_

#include <ctype.h>

#define TRUE  'T'
#define FALSE 'F'
#define NIL   'nil'

int number(char *);
int alpha(char *);
int atom(char *);
int sequence(char *);
int sexpression(char *);

#endif //_SEXP_H_
