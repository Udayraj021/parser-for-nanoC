%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
%}

/* Definitions */
DIGIT       [0-9]
NONZERO     [1-9]
LETTER      [a-zA-Z_]
ALNUM       [a-zA-Z0-9_]
HEX         [0-9a-fA-F]
OCT         [0-7]

/* Integer suffixes */
USUFFIX     ([uU])
LSUFFIX     ([lL]|[lL][lL]|[Ll][Ll])
INTSUFFIX   ({USUFFIX}{LSUFFIX}?|{LSUFFIX}{USUFFIX}?)

/* Float suffixes */
FSUFFIX     [fFlL]
EXPONENT    ([eE][+-]?{DIGIT}+)

/* String and char escape sequences */
ESCAPE      \\['"?\\abfnrtvx0-7]

/* Whitespace */
WS          [ \t\r\n\f\v]

%%

 /* Keywords */
"void"          { return VOID; }
"char"          { return CHAR; }
"short"         { return SHORT; }
"int"           { return INT; }
"long"          { return LONG; }
"float"         { return FLOAT; }
"double"        { return DOUBLE; }
"signed"        { return SIGNED; }
"unsigned"      { return UNSIGNED; }
"_Bool"         { return BOOL; }
"static"        { return STATIC; }
"if"            { return IF; }
"else"          { return ELSE; }
"while"         { return WHILE; }
"do"            { return DO; }
"for"           { return FOR; }
"return"        { return RETURN; }
"break"         { return BREAK; }
"continue"      { return CONTINUE; }
"case"          { return CASE; }
"default"       { return DEFAULT; }

 /* Identifiers */
{LETTER}{ALNUM}*    { return IDENTIFIER; }

 /* Integer constants */
0[xX]{HEX}+{INTSUFFIX}?    { return INTEGER_CONSTANT; }
0{OCT}*{INTSUFFIX}?        { return INTEGER_CONSTANT; }
{NONZERO}{DIGIT}*{INTSUFFIX}?  { return INTEGER_CONSTANT; }

 /* Floating constants */
{DIGIT}+{EXPONENT}{FSUFFIX}?                { return FLOATING_CONSTANT; }
{DIGIT}*"."{DIGIT}+{EXPONENT}?{FSUFFIX}?   { return FLOATING_CONSTANT; }
{DIGIT}+"."{DIGIT}*{EXPONENT}?{FSUFFIX}?   { return FLOATING_CONSTANT; }

 /* Character constants */
'([^'\\]|{ESCAPE})+'   { return CHARACTER_CONSTANT; }

 /* String literals */
\"([^"\\]|{ESCAPE})*\"    { return STRING_LITERAL; }

 /* Operators */
"..."           { return ELLIPSIS; }
">>="           { return RIGHT_ASSIGN; }
"<<="           { return LEFT_ASSIGN; }
"+="            { return ADD_ASSIGN; }
"-="            { return SUB_ASSIGN; }
"*="            { return MUL_ASSIGN; }
"/="            { return DIV_ASSIGN; }
"%="            { return MOD_ASSIGN; }
"&="            { return AND_ASSIGN; }
"^="            { return XOR_ASSIGN; }
"|="            { return OR_ASSIGN; }
">>"            { return RIGHT_OP; }
"<<"            { return LEFT_OP; }
"++"            { return INC_OP; }
"--"            { return DEC_OP; }
"&&"            { return AND_OP; }
"||"            { return OR_OP; }
"<="            { return LE_OP; }
">="            { return GE_OP; }
"=="            { return EQ_OP; }
"!="            { return NE_OP; }
";"             { return ';'; }
"{"             { return '{'; }
"}"             { return '}'; }
","             { return ','; }
":"             { return ':'; }
"="             { return '='; }
"("             { return '('; }
")"             { return ')'; }
"["             { return '['; }
"]"             { return ']'; }
"."             { return '.'; }
"&"             { return '&'; }
"!"             { return '!'; }
"~"             { return '~'; }
"-"             { return '-'; }
"+"             { return '+'; }
"*"             { return '*'; }
"/"             { return '/'; }
"%"             { return '%'; }
"<"             { return '<'; }
">"             { return '>'; }
"^"             { return '^'; }
"|"             { return '|'; }
"?"             { return '?'; }

 /* Whitespace - skip */
{WS}+           { /* skip */ }

 /* Single line comments */
"//"[^\n]*      { /* skip */ }

 /* Multi-line comments */
"/*"([^*]|\*+[^*/])*\*+"/"  { /* skip */ }

 /* Unknown characters */
.               { fprintf(stderr, "Unknown character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
