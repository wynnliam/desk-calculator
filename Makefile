.phony: clean

all: lex.l grammar.y
	lex lex.l
	yacc grammar.y
	gcc y.tab.c -ly -lfl

clean:
	-rm a.out lex.yy.c y.tab.c
