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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    IDENTIFIER = 258,              /* IDENTIFIER  */
    INTEGER_CONSTANT = 259,        /* INTEGER_CONSTANT  */
    FLOATING_CONSTANT = 260,       /* FLOATING_CONSTANT  */
    CHARACTER_CONSTANT = 261,      /* CHARACTER_CONSTANT  */
    STRING_LITERAL = 262,          /* STRING_LITERAL  */
    VOID = 263,                    /* VOID  */
    CHAR = 264,                    /* CHAR  */
    SHORT = 265,                   /* SHORT  */
    INT = 266,                     /* INT  */
    LONG = 267,                    /* LONG  */
    FLOAT = 268,                   /* FLOAT  */
    DOUBLE = 269,                  /* DOUBLE  */
    SIGNED = 270,                  /* SIGNED  */
    UNSIGNED = 271,                /* UNSIGNED  */
    BOOL = 272,                    /* BOOL  */
    STATIC = 273,                  /* STATIC  */
    IF = 274,                      /* IF  */
    ELSE = 275,                    /* ELSE  */
    WHILE = 276,                   /* WHILE  */
    DO = 277,                      /* DO  */
    FOR = 278,                     /* FOR  */
    RETURN = 279,                  /* RETURN  */
    BREAK = 280,                   /* BREAK  */
    CONTINUE = 281,                /* CONTINUE  */
    CASE = 282,                    /* CASE  */
    DEFAULT = 283,                 /* DEFAULT  */
    ELLIPSIS = 284,                /* ELLIPSIS  */
    RIGHT_ASSIGN = 285,            /* RIGHT_ASSIGN  */
    LEFT_ASSIGN = 286,             /* LEFT_ASSIGN  */
    ADD_ASSIGN = 287,              /* ADD_ASSIGN  */
    SUB_ASSIGN = 288,              /* SUB_ASSIGN  */
    MUL_ASSIGN = 289,              /* MUL_ASSIGN  */
    DIV_ASSIGN = 290,              /* DIV_ASSIGN  */
    MOD_ASSIGN = 291,              /* MOD_ASSIGN  */
    AND_ASSIGN = 292,              /* AND_ASSIGN  */
    XOR_ASSIGN = 293,              /* XOR_ASSIGN  */
    OR_ASSIGN = 294,               /* OR_ASSIGN  */
    RIGHT_OP = 295,                /* RIGHT_OP  */
    LEFT_OP = 296,                 /* LEFT_OP  */
    INC_OP = 297,                  /* INC_OP  */
    DEC_OP = 298,                  /* DEC_OP  */
    AND_OP = 299,                  /* AND_OP  */
    OR_OP = 300,                   /* OR_OP  */
    LE_OP = 301,                   /* LE_OP  */
    GE_OP = 302,                   /* GE_OP  */
    EQ_OP = 303,                   /* EQ_OP  */
    NE_OP = 304,                   /* NE_OP  */
    LOWER_THAN_ELSE = 305          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IDENTIFIER 258
#define INTEGER_CONSTANT 259
#define FLOATING_CONSTANT 260
#define CHARACTER_CONSTANT 261
#define STRING_LITERAL 262
#define VOID 263
#define CHAR 264
#define SHORT 265
#define INT 266
#define LONG 267
#define FLOAT 268
#define DOUBLE 269
#define SIGNED 270
#define UNSIGNED 271
#define BOOL 272
#define STATIC 273
#define IF 274
#define ELSE 275
#define WHILE 276
#define DO 277
#define FOR 278
#define RETURN 279
#define BREAK 280
#define CONTINUE 281
#define CASE 282
#define DEFAULT 283
#define ELLIPSIS 284
#define RIGHT_ASSIGN 285
#define LEFT_ASSIGN 286
#define ADD_ASSIGN 287
#define SUB_ASSIGN 288
#define MUL_ASSIGN 289
#define DIV_ASSIGN 290
#define MOD_ASSIGN 291
#define AND_ASSIGN 292
#define XOR_ASSIGN 293
#define OR_ASSIGN 294
#define RIGHT_OP 295
#define LEFT_OP 296
#define INC_OP 297
#define DEC_OP 298
#define AND_OP 299
#define OR_OP 300
#define LE_OP 301
#define GE_OP 302
#define EQ_OP 303
#define NE_OP 304
#define LOWER_THAN_ELSE 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
