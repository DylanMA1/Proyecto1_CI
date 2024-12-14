package JFLEX;

import java_cup.runtime.Symbol;

%%

%cup
%class Lexer
%unicode
%line
%column

%%

// Palabras reservadas
"rodolfo" { return new Symbol(sym.INTEGER); }
"bromista" { return new Symbol(sym.FLOAT); }
"trueno" { return new Symbol(sym.BOOL); }
"cupido" { return new Symbol(sym.CHAR); }
"cometa" { return new Symbol(sym.STRING); }

"abrecuento" { return new Symbol(sym.OPEN_BLOCK); }
"cierracuento" { return new Symbol(sym.CLOSE_BLOCK); }
"abreempaque" { return new Symbol(sym.OPEN_BRACKET); }
"cierraempaque" { return new Symbol(sym.CLOSE_BRACKET); }
"abreregalo" { return new Symbol(sym.OPEN_PAREN); }
"cierraregalo" { return new Symbol(sym.CLOSE_PAREN); }
"entrega" { return new Symbol(sym.ASSIGN); }
"finregalo" { return new Symbol(sym.END_STATEMENT); }

// Operadores aritméticos
"navidad" { return new Symbol(sym.PLUS); }
"intercambio" { return new Symbol(sym.MINUS); }
"reyes" { return new Symbol(sym.DIVIDE); }
"nochebuena" { return new Symbol(sym.MULTIPLY); }
"magos" { return new Symbol(sym.MODULO); }
"adviento" { return new Symbol(sym.POWER); }

// Operadores unarios
"quien" { return new Symbol(sym.INCREMENT); }
"grinch" { return new Symbol(sym.DECREMENT); }

// Operadores relacionales
"snowball" { return new Symbol(sym.LESS_THAN); }
"evergreen" { return new Symbol(sym.LESS_EQUAL); }
"minstix" { return new Symbol(sym.GREATER_THAN); }
"upatree" { return new Symbol(sym.GREATER_EQUAL); }
"mary" { return new Symbol(sym.EQUAL); }
"openslae" { return new Symbol(sym.NOT_EQUAL); }

// Operadores lógicos
"melchor" { return new Symbol(sym.AND); }
"gaspar" { return new Symbol(sym.OR); }
"baltazar" { return new Symbol(sym.NOT); }

// Estructuras de control
"elfo" { return new Symbol(sym.IF); }
"hada" { return new Symbol(sym.ELSE); }
"envuelve" { return new Symbol(sym.WHILE); }
"duende" { return new Symbol(sym.FOR); }
"varios" { return new Symbol(sym.SWITCH); }
"historia" { return new Symbol(sym.CASE); }
"ultimo" { return new Symbol(sym.DEFAULT); }
"corta" { return new Symbol(sym.BREAK); }
"envia" { return new Symbol(sym.RETURN); }
"sigue" { return new Symbol(sym.COLON); }

// Funciones I/O
"narra" { return new Symbol(sym.PRINT); }
"escucha" { return new Symbol(sym.READ); }

// Identificadores
"_[a-zA-Z0-9_]+_" { return new Symbol(sym.IDENTIFIER, yytext()); }

// Literales
[0-9]+ { return new Symbol(sym.INT_LITERAL, Integer.parseInt(yytext())); }
[0-9]+\.[0-9]+ { return new Symbol(sym.FLOAT_LITERAL, Float.parseFloat(yytext())); }
"true"|"false" { return new Symbol(sym.BOOL_LITERAL, Boolean.parseBoolean(yytext())); }
'[^']' { return new Symbol(sym.CHAR_LITERAL, yytext().charAt(1)); }
"\".*?\"" { return new Symbol(sym.STRING_LITERAL, yytext().substring(1, yytext().length() - 1)); }

// Comentarios
"#.*" { /* Comentario de una línea: ignorar */ }
"/_([^_]|_[^/])*_/" { /* Comentario multi-línea: ignorar */ }

// Manejo de errores léxicos
. {
  System.err.println("Error léxico: " + yytext() + " en línea " + yyline + ", columna " + yycolumn);
}