%{
//**************************************
// lang.l
//
// Scanner definition file for CST 320 project
//
// Author: Phil Howard 
// phil.howard@oit.edu
//
// Date: Nov. 23, 2015
//

#include "tokens.h"

#define DO_RETURN(a) return (a)
//#define DO_RETURN(a) return Return(a)
int Return(int val);

%}

%option noyywrap
%option noinput
%option nounput
%option yylineno


    /* definitions go here. period is an example. */
equals         "=="
and            "&&"
or             "||"
float           [0-9]+'.'[0-9]+
punctuation     ['\(\)\{\}\[\]\;\,\.\+\-\/\*\%\=']
identifier      [A-Za-z_][A-Za-z0-9_]*
integer_const   -?[0-9]+
float_const     [0-9]+[\.][0-9]+
comment         "//".*$
junk            .
%%

    // token definitions go here. "if" is an example.
"if"                        DO_RETURN(IF);
"endif"                     DO_RETURN(ENDIF);
"else"                      DO_RETURN(ELSE);
"while"                     DO_RETURN(WHILE);
"print"                     DO_RETURN(PRINT);
"int"                       DO_RETURN(INT);
"float"                     DO_RETURN(FLOAT);
"struct"                    DO_RETURN(STRUCT);
"return"                    DO_RETURN(RETURN);
"char"                      DO_RETURN(CHAR);
{integer_const}             DO_RETURN(INT_VAL);
{float_const}               DO_RETURN(FLOAT_VAL);
[ \t\n]                     {}
"=="                        DO_RETURN(EQUALS);
"&&"                        DO_RETURN(AND);
"||"                        DO_RETURN(OR);
{punctuation}               DO_RETURN(yytext[0]);
{identifier}                DO_RETURN(IDENTIFIER);
{comment}                   {}
{junk}                      DO_RETURN(JUNK_TOKEN);
%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}

