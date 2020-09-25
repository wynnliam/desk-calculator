/* Liam Wynn, 9/25/2020, Desk Calculator */

/*
	Example taken from Chapter 4 of Compilers: Principles, Tools, and Techniques
*/

number	[0-9]+\.?|[0.9]*\.[0-9]+
%%
[ ]			{ /* Skip blanks */}
{number}	{ sscanf(yytext, "%lf", &yylval);
			  return NUMBER; }
\n|.		{ return yytext[0]; }
