/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    UPDATE = 258,                  /* UPDATE  */
    WHERE = 259,                   /* WHERE  */
    SUM = 260,                     /* SUM  */
    CREATE = 261,                  /* CREATE  */
    DROP = 262,                    /* DROP  */
    ALTER = 263,                   /* ALTER  */
    SELECT = 264,                  /* SELECT  */
    DELETE = 265,                  /* DELETE  */
    INSERT = 266,                  /* INSERT  */
    COUNT = 267,                   /* COUNT  */
    MAX = 268,                     /* MAX  */
    ADD = 269,                     /* ADD  */
    ALL = 270,                     /* ALL  */
    ALTER_COLUMN = 271,            /* ALTER_COLUMN  */
    AVG = 272,                     /* AVG  */
    LPAREN = 273,                  /* LPAREN  */
    RPAREN = 274,                  /* RPAREN  */
    TABLE = 275,                   /* TABLE  */
    INDEX = 276,                   /* INDEX  */
    ON = 277,                      /* ON  */
    COLUMN = 278,                  /* COLUMN  */
    SET = 279,                     /* SET  */
    DEFAULT = 280,                 /* DEFAULT  */
    FROM = 281,                    /* FROM  */
    INTO = 282,                    /* INTO  */
    VALUES = 283,                  /* VALUES  */
    ID = 284,                      /* ID  */
    INTEGER = 285,                 /* INTEGER  */
    STRING = 286,                  /* STRING  */
    ASC = 287,                     /* ASC  */
    DT_INTEGER = 288,              /* DT_INTEGER  */
    DT_STRING = 289                /* DT_STRING  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
