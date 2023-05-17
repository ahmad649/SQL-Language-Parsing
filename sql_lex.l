%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap
%option debug


%%
CREATE  { return CREATE; }
ALTER                    { return ALTER; }
DROP                     { return DROP; }
SELECT                   { return SELECT; }
DELETE                   { return DELETE; }
INSERT  { return INSERT; }
TABLE   { return TABLE;}
UPDATE  {return UPDATE;}
WHERE                    { return WHERE; }
SUM                      { return SUM; }
COUNT                    { return COUNT; }
MAX                      { return MAX; }
"INTEGER" {return DT_INTEGER;}
"STRING" {return DT_STRING;}
SET { return SET;}
INDEX { return INDEX; }
ON  { return ON; }
FROM    { return FROM; }
INTO    { return INTO; }
VALUES  { return VALUES; }
ADD                      { return ADD; }
DEFAULT { return DEFAULT; }
ALL                      { return ALL; }
COLUMN  { return COLUMN; }
ALTER_COLUMN             { return ALTER_COLUMN; }
ASC                      { return ASC; }
AVG                      { return AVG; }
"("                       { return '('; }
")"                       { return ')'; }
"*" { return '*'; }
"," { return ','; }
"=" { return '='; } 
"<>"    { return '<>'; }
"<" { return '<'; }
">" { return '>'; }
"<="    { return '<='; }
">="    { return '>='; }
";"                        { return ';'; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+ { return INTEGER; }
\"[^"]*\" { return STRING; }
%%


// int main(int argc, char* argv[]) {
//     // Check if an input file is provided
//     if (argc != 2) {
//         printf("Usage: %s input_file\n", argv[0]);
//         return 1;
//     }

//     // Open the input file
//     FILE* inputFile = fopen(argv[1], "r");
//     if (!inputFile) {
//         printf("Error opening input file.\n");
//         return 1;
//     }

//     // Open the output file
//     FILE* outputFile = fopen("output.txt", "w");
//     if (!outputFile) {
//         printf("Error creating output file.\n");
//         fclose(inputFile);
//         return 1;
//     }

//     // Set the input file for Flex
//     yyin = inputFile;

//     int token;
//     int line = 1;

//     // Tokenize the input and write tokens to the output file
//     while ((token = yylex()) != 0) {
//         if (token == '\n') {
//             line++;
//         }else{
//             fprintf(outputFile, "Token ID: %d, Token: %s, Line: %d\n", token, yytext, line);
//         }

//     }

//     // Close the input and output files
//     fclose(inputFile);
//     fclose(outputFile);

//     return 0;
// }