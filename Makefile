all: lex.l grammar.y
	lex lex.l
	yacc grammar.y
	gcc y.tab.c -ly -lfl
