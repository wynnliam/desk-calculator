/* Liam Wynn, 9/25/2020, Desk Calculator */

/*
	Example taken from Chapter 4 of Compilers: Principles, Tools, and Techniques
*/

%{
#include <ctype.h>
#include <stdio.h>
#define YYSTYPE double
%}

%token		NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

lines		: lines expr '\n'	{ printf("%g\n", $2); }
			| lines '\n'
			| /* empty */
			| error '\n' { yyerror("reenter last line:");
						   yyerrok; }
			;

expr		: expr '+' expr		{$$ = $1 + $3;}
			| expr '-' expr		{$$ = $1 - $3;}
			| expr '*' expr		{$$ = $1 * $3;}
			| expr '/' expr		{$$ = $1 / $3;}
			| '(' expr ')'		{$$ = $2;}
			| '-' expr %prec UMINUS {$$ = - $2;}
			| NUMBER
			;

%%

#include "lex.yy.c"
