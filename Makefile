all: lab4

lab4: lab4.lex.o
	gcc -o $@ $+

%.o: $.c
	gcc -c -o $@ $<

%.lex.c: %.l
	lex -o $@ $<

a.out: test.c lab4
	./lab4 < $< > $@

test: lab4 a.out

clean:
	$(RM) *.o
	$(RM) *.lex.c
	$(RM) *.out
	$(RM) lab4