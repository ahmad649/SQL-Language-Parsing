%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap
%{
// Define token IDs
#define CREATE 1
#define ALTER 2
#define DROP 3
#define SELECT 4
#define DELETE 5
#define INSERT 6
#define UPDATE 7
#define FUNCTION 8
#define WHERE 9
#define SUM 10
#define COUNT 11
#define MAX 12
#define ADD 13
#define ALL 14
#define ALTER_COLUMN 15
#define AND 16
#define ANY 17
#define AS 18
#define ASC 19
#define AVG 20
#define BETWEEN 21
#define CASE 22
#define CHECK 23
#define COLUMN 24
#define CONSTRAINT 25
#define CREATE_DATABASE 26
#define CREATE_INDEX 27
#define CREATE_OR_REPLACE_VIEW 28
#define CREATE_PROCEDURE 29
#define CREATE_TABLE 30
#define CREATE_UNIQUE_INDEX 31
#define CREATE_VIEW 32
#define IDENTIFIER 33
#define INTEGER 34
#define STRING 35
#define COMMA 36
#define LPAREN 37
#define RPAREN 38
#define SEMICOLON 39
%}

%%
CREATE                   { return CREATE; }
ALTER                    { return ALTER; }
DROP                     { return DROP; }
SELECT                   { return SELECT; }
DELETE                   { return DELETE; }
INSERT                   { return INSERT; }
UPDATE                   { return UPDATE; }
FUNCTION                 { return FUNCTION; }
WHERE                    { return WHERE; }
SUM                      { return SUM; }
COUNT                    { return COUNT; }
MAX                      { return MAX; }
ADD                      { return ADD; }
ALL                      { return ALL; }
ALTER_COLUMN             { return ALTER_COLUMN; }
AND                      { return AND; }
ANY                      { return ANY; }
AS                       { return AS; }
ASC                      { return ASC; }
AVG                      { return AVG; }
BETWEEN                  { return BETWEEN; }
CASE                     { return CASE; }
CHECK                    { return CHECK; }
COLUMN                   { return COLUMN; }
CONSTRAINT               { return CONSTRAINT; }
CREATE_DATABASE          { return CREATE_DATABASE; }
CREATE_INDEX             { return CREATE_INDEX; }
CREATE_OR_REPLACE_VIEW   { return CREATE_OR_REPLACE_VIEW; }
CREATE_PROCEDURE         { return CREATE_PROCEDURE; }
CREATE_TABLE             { return CREATE_TABLE; }
CREATE_UNIQUE_INDEX      { return CREATE_UNIQUE_INDEX; }
CREATE_VIEW              { return CREATE_VIEW; }
[[:alpha:]_][[:alnum:]_]* { return IDENTIFIER; }
[[:digit:]]+             { return INTEGER; }
\n                        {return '\n';}
'[^']*'                  { return STRING; }
,                        { return COMMA; }
\(                       { return LPAREN; }
\)                       { return RPAREN; }
;                        { return SEMICOLON; }

.                        { /* Ignore unrecognized characters */ }
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

    // Open the output file
    FILE* outputFile = fopen("output.txt", "w");
    if (!outputFile) {
        printf("Error creating output file.\n");
        fclose(inputFile);
        return 1;
    }

    // Set the input file for Flex
    yyin = inputFile;

    int token;
    int line = 1;

    // Tokenize the input and write tokens to the output file
    while ((token = yylex()) != 0) {
        if (token == '\n') {
            line++;
        }else{
            fprintf(outputFile, "Token ID: %d, Token: %s, Line: %d\n", token, yytext, line);
        }

    }

    // Close the input and output files
    fclose(inputFile);
    fclose(outputFile);

    return 0;
}