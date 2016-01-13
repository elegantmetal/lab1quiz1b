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
stuff           ['\)\+']
blob1           [0-90-9]+
blob2           [\.][0-9]*[0-90-9]+
junk            .
%%

    // token definitions go here. "if" is an example.
"my"            DO_RETURN(MY);
"token"         DO_RETURN(TOKEN);
[ \t\n]         {}
{blob1}         DO_RETURN(BLOB1);
{blob2}         DO_RETURN(BLOB2);
{stuff}         DO_RETURN(yytext[0]);
{junk}          DO_RETURN(JUNK);

%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}
