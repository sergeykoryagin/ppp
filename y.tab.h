/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     yLOCATE = 258,
     yFOR = 259,
     yWHILE = 260,
     yNOOPTIMIZE = 261,
     yNEXT = 262,
     yRECORD = 263,
     yREST = 264,
     yALL = 265,
     yPLUS = 266,
     yMINUS = 267,
     yMULTIPLY = 268,
     yDIVIDE = 269,
     yLEQ = 270,
     yGEQ = 271,
     yNEQ = 272,
     yEQUAL = 273,
     yLESS = 274,
     yGREAT = 275,
     yASSIGN = 276,
     yIDENTIFIER = 277,
     yNUMBER = 278,
     yAND = 279,
     yOR = 280,
     yNOT = 281,
     yOP = 282,
     yCP = 283,
     ySEMICOLON = 284,
     yANY = 285,
     UMINUS = 286
   };
#endif
/* Tokens.  */
#define yLOCATE 258
#define yFOR 259
#define yWHILE 260
#define yNOOPTIMIZE 261
#define yNEXT 262
#define yRECORD 263
#define yREST 264
#define yALL 265
#define yPLUS 266
#define yMINUS 267
#define yMULTIPLY 268
#define yDIVIDE 269
#define yLEQ 270
#define yGEQ 271
#define yNEQ 272
#define yEQUAL 273
#define yLESS 274
#define yGREAT 275
#define yASSIGN 276
#define yIDENTIFIER 277
#define yNUMBER 278
#define yAND 279
#define yOR 280
#define yNOT 281
#define yOP 282
#define yCP 283
#define ySEMICOLON 284
#define yANY 285
#define UMINUS 286




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 2 "calc.yacc"
{
        int num;
        char *str;
}
/* Line 1529 of yacc.c.  */
#line 116 "y.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

