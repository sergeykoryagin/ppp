%union 
{
        int num;
        char *str;
}

%token yLOCATE yFOR yWHILE yNOOPTIMIZE yNEXT yRECORD yREST yALL
%token yPLUS yMINUS yMULTIPLY yDIVIDE yLEQ yGEQ yNEQ yEQUAL yLESS yGREAT yASSIGN
%token <str> yIDENTIFIER
%token <num> yNUMBER 
%token yAND yOR yNOT yOP yCP ySEMICOLON yANY

%type <num> exp term

%left yOR
%left yAND
%left yNOT
%left yLESS yGREAT yLEQ yGEQ yNEQ yASSIGN yEQUAL
%left yPLUS yMINUS
%left yMULTIPLY yDIVIDE
%right UMINUS

%{
#include <stdio.h>	
#include <stdlib.h>
#include "variables.h"


extern int position;
extern int yylineno;
extern int errorCount;


extern int yylex(void);
void yyerror(char *);
void runtime_error(char *str);

VariableContainerNode *root = NULL;


%}

%%

list:            
                 | list stat ySEMICOLON
                 | list stat error { yyerror("semicolon is missing"); }
                 | list error ySEMICOLON { yyerror("wrong statement"); }
                 ;

stat:            locateFor
                  | yIDENTIFIER yASSIGN exp {
                    if (root == NULL) {
                        root = createVariableContainerNodeList();
                    }
                    int num = $3;
                    char *variableName = $1;
                    printf("%s = %d\n", variableName, num);
                    assignVariable(&root, variableName, num);
                  }
                 | yIDENTIFIER error exp { yyerror("assignment expected"); }
                 ;

locateFor:      yLOCATE for_exp scope while_exp optimize_exp
                ;

lexp:            exp yLESS exp              { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp yGREAT exp         { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp yLEQ exp             { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp yGEQ exp             { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp yNEQ exp             { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp yEQUAL exp           { printf("left expression value = %d\nright expression value = %d\n", $1, $3); }
                 | exp error exp            { yyerror("comparison sign is missing"); }
                 | lexp yAND lexp
                 | lexp yOR lexp
                 | yNOT lexp
                 | yOP lexp yCP
                 ;

exp:              term
                 | exp yPLUS exp            { $$ = $1 + $3;   }
                 | exp yMINUS exp           { $$ = $1 - $3;   }
                 | exp yMULTIPLY exp        { $$ = $1 * $3;   }
                 | exp yDIVIDE exp {
                    if ($3 == 0) {
                        runtime_error("division by zero.");
                    } else {
                        $$ = $1 / $3;
                    }
                  }
                 | yMINUS exp %prec UMINUS  { $$ = -$2;       }
                 | yOP exp yCP              { $$ = $2;        }
                 ;

term:             yNUMBER                    { $$ = $1; }
                 | yIDENTIFIER                  {
                    Variable *variable = getVariableFromList(&root, $1);
                    if (variable == NULL) {
                        char msg[80];
                        sprintf(msg, "unknown identifier %s", $1);
                        runtime_error(msg);
                    } else {
                        $$ = variable->value;
                    }
                  }
                 ;

scope:           
                 | yALL
                 | yNEXT exp { printf("expression value = %d\n", $2); }
                 | yNEXT error { yyerror("expected an expression after NEXT"); }
                 | yRECORD exp { printf("expression value = %d\n", $2); }
                 | yRECORD error { yyerror("expected an expression after RECORD"); }
                 | yREST
                 ;

for_exp:         yFOR lexp
                 ;

while_exp:       yWHILE lexp
                 ;

optimize_exp:    
                |yNOOPTIMIZE
                 ;


%%

int main(int argc, char **argv) {
    yyparse();
    if (errorCount == 0) {
        printf("Parsed successfully.\n");
    } else {
        printf("Parsed with %d errors.\n", errorCount);
    }
}

void yyerror(char *str) {
	if (strcmp(str, "syntax error")) { printf("at line %d, position %d : syntax error: %s\n", yylineno, position, str); errorCount++; }
}

void runtime_error(char *str) {
    printf("at line %d, position %d : runtime error: %s\n", yylineno, position, str); errorCount++;
}