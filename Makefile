LEX=lex
YACC=yacc
CC=gcc

LFLAGS=
CFLAGS=-Wall -Wno-unused-label -Wno-unused -g

all: project2

project2: project2.lex.o
	$(CC) -o $@ $+

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.lex.c: %.l
	$(LEX) $(LFLAGS) -o $@ $<

%.tex: %.c lab2.l
	./project2 < $< > $@
	
%.pdf: %.tex
	pdflatex $<

test: project2 test.out

clean:
	$(RM) *.o
	$(RM) *.lex.c
	$(RM) *.tex *.log *.aux *.pdf
	$(RM) html2latex

.PHONY: clean all test
