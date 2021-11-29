%option yylineno
%{
#include <stdio.h>
#include "y.tab.h"

int position = 0;
int errorCount = 0;
%}

%%
[Ll][Oo][Cc][Aa][Tt][Ee]    { position += yyleng; printf("LOCATE\n"); return yLOCATE; }
[Ff][Oo][Rr] 		        { position += yyleng; printf("FOR\n"); return yFOR; }
[Nn][Ee][Xx][Tt] 	        { position += yyleng; printf("NEXT\n"); return yNEXT; }
[Re][Ee][Cc][Oo][Rr][Dd]	{ position += yyleng; printf("RECORD\n"); return yRECORD; }
[Ww][Hh][Ii][Ll][Ee]    	{ position += yyleng; printf("WHILE\n"); return yWHILE; }
[Rr][Ee][Ss][Tt] 	        { position += yyleng; printf("NEXT\n"); return yREST; }
[Nn][Oo][Tt]		        { position += yyleng; printf("NOT\n"); return yNOT; }
[Aa][Nn][Dd]		        { position += yyleng; printf("AND\n"); return yAND; }
[Aa][Ll][Ll]		        { position += yyleng; printf("AND\n"); return yALL; }
[Oo][Rr]			        { position += yyleng; printf("OR\n"); return yOR; }
[Nn][Oo][Oo][Pp][Tt][Ii][Mm][Ii][Zz][Ee]     { position += yyleng; printf("NOOPTIMIZE\n"); return yNOOPTIMIZE; }
[a-zA-Z][a-zA-Z0-9]* 	    { position += yyleng; printf("IDENTIFIER\n"); yylval.str = strdup(yytext);  return yIDENTIFIER; }

(0|[1-9][0-9]*)             {  
                                position += yyleng;
                                yylval.num = yytext[0] - '0';
                                for (int i = 1; i < yyleng; i++) {
                                    yylval.num = yylval.num * 10 + (yytext[i] - '0'); 
                                } 
                                printf("NUMBER = %d\n", yylval.num); 
                                return yNUMBER;
                            }

"="			                { position += yyleng; printf("ASSIGN\n"); return yASSIGN; }
"=="		                { position += yyleng; printf("EQUAL\n"); return yEQUAL; }
">="		                { position += yyleng; printf("GEQ\n"); return yGEQ; }
">"			                { position += yyleng; printf("GREAT\n"); return yGREAT; }
"<="		                { position += yyleng; printf("LEQ\n"); return yLEQ; }
"<"			                { position += yyleng; printf("LESS\n"); return yLESS; }
"!="		                { position += yyleng; printf("NEQ\n"); return yNEQ; }
"+"			                { position += yyleng; printf("PLUS\n"); return yPLUS; }
"-"			                { position += yyleng; printf("MINUS\n"); return yMINUS; }
"/"			                { position += yyleng; printf("DIVIDE\n"); return yDIVIDE; }
"*"			                { position += yyleng; printf("MULTIPLY\n"); return yMULTIPLY; }
"("                         { position += yyleng; printf("OP\n"); return yOP; }
")"                         { position += yyleng; printf("CP\n"); return yCP; }
";"			                { position++; printf("SEMICOLON\n"); return ySEMICOLON; }
"\n"		                { position = 0; printf("\n"); }
[ \t]+                      { position++; };
.                           { position++;
                                errorCount++; 
                                printf("at line %d, position %d : lexical error: unknown character '%c'\n", yylineno, position, yytext[0]); 
                            }
