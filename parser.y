%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Declare the lexer function
int yylex();

// Define the token variable and line number
extern int yylineno;
extern char* yytext;
extern int yyparse();
extern FILE* yyin;
extern int yydebug;

// Function to handle syntax errors
void yyerror(const char* msg) {
    fprintf(stderr, "Syntax Error at line %d: %s\n", yylineno, msg);
    exit(1);
}
%}
%token UPDATE
%token WHERE
%token SUM
%token CREATE DROP ALTER SELECT DELETE INSERT COUNT MAX
%token ADD ALL ALTER_COLUMN AVG LPAREN RPAREN
%token TABLE INDEX ON COLUMN SET DEFAULT FROM INTO VALUES ID INTEGER STRING
%token ASC DT_INTEGER DT_STRING

%%
query: statement ';'
    | query statement ';'
    ;

statement: createStatement
    | alterStatement
    | dropStatement
    | selectStatement
    | deleteStatement
    | insertStatement
    | updateStatement
    ;

createStatement: CREATE TABLE tableName '(' columnList ')'
    | CREATE INDEX indexName ON tableName '(' columnList ')'
    | CREATE TABLE tableName '(' columnDefinition ')'
    ;

alterStatement: ALTER TABLE tableName alterAction
    ;   

alterAction: ADD COLUMN columnDefinition
    | ALTER_COLUMN columnName actionType
    ;

actionType: SET dataType
    | DROP DEFAULT
    ;

dropStatement: DROP TABLE tableName
    | DROP INDEX indexName
    ;

selectStatement: SELECT selectList FROM tableNameList | SELECT selectList FROM tableNameList whereClause
    ;

selectList: '*' | columnListWithBuiltInFuncs
    ;

whereClause: WHERE condition
    ;

condition: columnName operator value
    ;   

operator: '=' | "<>" | '<' | '>' | "<=" | ">="
    ;

deleteStatement: DELETE FROM tableName | DELETE FROM tableName whereClause
    ;

insertStatement: INSERT INTO tableName '(' columnList ')' VALUES '(' valueList ')'
    ;

updateStatement: UPDATE tableName SET updateList whereClause
    ;

updateList: columnName '=' valueList
    ;

valueList: value | valueList ',' value
    ;

columnList: columnName | columnList ',' columnName
    ;

columnListWithBuiltInFuncs: builtinfunc '(' columnName ')' | columnName | columnListWithBuiltInFuncs ',' columnName
    ;

builtinfunc: COUNT | SUM | AVG
    ;

tableNameList: tableName | tableNameList ',' tableName
    ;

tableName: ID
    ;


columnDefinition: ID dataType | columnDefinition ',' ID dataType
    ;

indexName: ID
    ;

columnName: ID
    ;


value: INTEGER | STRING
    ;


dataType: DT_INTEGER | DT_STRING
    ;
%%

    int main(int argc, char* argv[]) {
        // Check if an input file is provided
        if (argc != 2) {
            printf("Usage: %s input_file\n", argv[0]);
            return 1;
        }

        // Open the input file
        FILE* inputFile = fopen(argv[1], "r");
        if (!inputFile) {
            printf("Error opening input file.\n");
            return 1;
        }

        // Set the input file for the lexer
        yyin = inputFile;
        /* printf("parsing started"); */
        yydebug = 1;
        yyparse();
        printf("parsing completed");

        // Close the input file
        fclose(inputFile);
        return 0;
    }
