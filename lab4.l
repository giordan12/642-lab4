%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>

%}

%option noyywrap nounput yylineno
%x		MULTCOMMENT COMMENT PREPROC PARA PRE OL UL LI
ID [a-zA-Z][a-zA-Z0-9_]*
%%


"/*" {
	BEGIN MULTCOMMENT;
}

<MULTCOMMENT>[n](\r)? {

}

<MULTCOMMENT>[ \t] {

}

<MULTCOMMENT>"/*" {
	BEGIN 0;
}

<MULTCOMMENT>. {

}

"//" {
	BEGIN COMMENT;
}

<COMMENT>[\n](\r)? {
	BEGIN 0;
}

<COMMENT>[ \t] {
	//just ignore it
}

<COMMENT>. {
	//again igonore it
}

"#" {
 	printf("PREPROC\n");
 	BEGIN PREPROC;
 }


 <PREPROC>[\n](\r)? {
 	BEGIN 0;
 }

 <PREPROC>[ \t] {
 	//just ignore this
 }

<PREPROC>. {
	//ignore anything symbol that appears
}

"(" {
	printf("(\n");
}

")" {
	printf(")\n");
}

"{" {
	printf("{\n");
}

"}" {
	printf("}\n");
}

"[" {
	printf("[\n");
}

"]" {
	printf("]");
}


"," {
	printf(",\n");
}

";" {
	printf(";\n");
}


[0-9]+ {
	printf("INTVAL\n");
}

[0-9]+"."[0-9]+"f" {
	printf("FLTVAL\n");
}

[0-9]+"."[0-9]+ {
	printf("DBLVAL\n");
}

"\""[^<]*"\"" {
	printf("STRVAL\n");
}


 "'"[^<]*"'" {
 	printf("CHARVAL\n");
 }

"void" {
	printf("VOID\n");
}

"char" {
	printf("CHAR\n");
}

"short" {
	printf("SHORT\n");
}

"int" {
	printf("INT\n");
}


"long" {
	printf("LONG\n");
}

"float" {
	printf("FLOAT\n");
}

"double" {
	printf("DOUBLE\n");
}

"==" {
	printf("EQ\n");
}

"!=" {
	printf("NE\n");
}

">=" {
	printf("GE\n");
}

"<=" {
	printf("LE\n");
}

"<" {
	printf("LT\n");
}

"+" {
	printf("ADD\n");
}

"-" {
	printf("SUB\n");
}

"*" {
	printf("MUL\n");
}

"/" {
	printf("DIV\n");
}

"%" {
	printf("MOD\n");
}

"||" {
	printf("MOD\n");
}

"&&" {
	printf("AND\n");
}

"|" {
	printf("BITOR\n");
}

"&" {
	printf("BITAND\n");
}

"^" {
	printf("BITXOR\n");
}

"!" {
	printf("NOT\n");
}

"~" {
	printf("COM\n");
}

"<<" {
	printf("LSH\n");
}

">>" {
	printf("RSH\n");
}

"=" {
	printf("SET\n");
}

"+=" {
	printf("SETADD\n");
}

"-=" {
	printf("SETSUB\n");
}

"*=" {
	printf("SETMUL\n");
}

"/=" {
	printf("SETDIV\n");
}

"%=" {
	printf("SETMOD\n");
}

"|=" {
	printf("SETDIV\n");
}

"&=" {
	printf("SETAND\n");
}

"^=" {
	printf("SETXOR\n");
}

"<<=" {
	printf("SETLSH\n");
}

">>=" {
	printf("SETRSH\n");
}

 "return" {
	printf("RETURN\n");
}

"do" {
	printf("DO\n");
}

"while" {
	printf("WHILE\n");
}

"for" {
	printf("FOR\n");
}

"switch" {
	printf("SWITCH\n");
}

"case" {
	printf("CASE\n");
}

"default" {
	printf("DEFAULT\n");
}

"if" {
	printf("IF\n");
}

"else" {
	printf("ELSE\n");
}

"continue" {
	printf("CONTINUE\n");
}

"break" {
	printf("BREAK\n");
}

"goto" {
	printf("GOTO\n");
}

"unsigned" {
	printf("UNSIGNED");
}

"typedef" {
	printf("TYPEDEF\n");
}

"struct" {
	printf("STRUCT\n");
}

"union" {
	printf("UNION\n");
}

"const" {
	printf("CONST\n");
}

"static" {
	printf("STATIC\n");
}

"extern" {
	printf("EXTERN\n");
}

"auto" {
	printf("AUTO\n");
}

"register" {
	printf("REGISTER\n");
}

"sizeof" {
	printf("SIZEOF\n");
}

{ID} {
	printf("ID\n");
}

. {
	//ignore anything here
}

[ \t] {
	//ignore this situation
}

[\n](\r)? {
	//ignore this situation
}


%%

int main( int argc, const char *argv[]){
	while(yylex()){

	}
    return 0;
}