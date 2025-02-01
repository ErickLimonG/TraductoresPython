/*ERICK ANTONIO LIMON GUEVARA*/
/*PIEDRA FLORES AXEL JESUS*/
/*LEONARDO JAVIER RODRIGUEZ MARTINEZ*/

package practica2;

/*Las importaciones necesarias*/
import java_cup.runtime.*;

%%

%class LexicoPython
%unicode
%cup
%line
%column

%{ 
 private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
      } 
%}

%eof{
System.out.println("End of file");
%eof}

%%

/* Fin de línea o salto de línea */
"\r|\n|\r\n" { /* Ignorar */ }

/* Espacios */
"[\t\f]*" { /* Ignorar */ }

/* Comentarios */
"\/\/.*" {
    System.out.println("LINE_COMMENT=" + yytext());
}

"\/\*.*\*\/" {
    System.out.println("MULTILINE_COMMENT=" + yytext());
}

/* Palabras reservadas */
"True" {
    System.out.println("TRUE=" + yytext());
}
"False" {
    System.out.println("FALSE=" + yytext());
}
"None" {
    System.out.println("NONE=" + yytext());
}
"and" {
    System.out.println("AND=" + yytext());
}
"or" {
    System.out.println("OR=" + yytext());
}
"not" {
    System.out.println("NOT=" + yytext());
}
"is" {
    System.out.println("IS=" + yytext());
}
"if" {
    System.out.println("IF=" + yytext());
}
"else" {
    System.out.println("ELSE=" + yytext());
}
"elif" {
    System.out.println("ELIF=" + yytext());
}
"for" {
    System.out.println("FOR=" + yytext());
}
"while" {
    System.out.println("WHILE=" + yytext());
}
"break" {
    System.out.println("BREAK=" + yytext());
}
"continue" {
    System.out.println("CONTINUE=" + yytext());
}
"pass" {
    System.out.println("PASS=" + yytext());
}
"try" {
    System.out.println("TRY=" + yytext());
}
"except" {
    System.out.println("EXCEPT=" + yytext());
}
"finally" {
    System.out.println("FINALLY=" + yytext());
}
"raise" {
    System.out.println("RAISE=" + yytext());
}
"assert" {
    System.out.println("ASSERT=" + yytext());
}
"def" {
    System.out.println("DEF=" + yytext());
}
"return" {
    System.out.println("RETURN=" + yytext());
}
"lambda" {
    System.out.println("LAMBDA=" + yytext());
}
"yield" {
    System.out.println("YIELD=" + yytext());
}
"class" {
    System.out.println("CLASS=" + yytext());
}
"import" {
    System.out.println("IMPORT=" + yytext());
}
"from" {
    System.out.println("FROM=" + yytext());
}
"in" {
    System.out.println("IN=" + yytext());
}
"as" {
    System.out.println("AS=" + yytext());
}
"del" {
    System.out.println("DEL=" + yytext());
}
"global" {
    System.out.println("GLOBAL=" + yytext());
}
"with" {
    System.out.println("WITH=" + yytext());
}
"nonlocal" {
    System.out.println("NONLOCAL=" + yytext());
}
"Async" {
    System.out.println("ASYNC=" + yytext());
}
"Await" {
    System.out.println("AWAIT=" + yytext());
}

[ \t\r\n]+ {
    System.out.println("WHITESPACE=" + yytext());
}

/* Comentario */
"#".* {
    System.out.println("LINE_COMMENT=" + yytext());
}

/* Identificador */
[a-zA-Z_][a-zA-Z0-9_]* {
    System.out.println("IDENTIFIER=" + yytext());
}



/* Números */
\d+ {
    System.out.println("INTEGER=" + yytext());
}

\d+\.\d+ {
    System.out.println("FLOAT=" + yytext());
}

/* Operadores relacionales, lógicos y aritméticos */
"+" {
    System.out.println("PLUS=" + yytext());
}
"-" {
    System.out.println("MINUS=" + yytext());
}
"*" {
    System.out.println("MULTIPLY=" + yytext());
}
"/" {
    System.out.println("DIVIDE=" + yytext());
}
"\\" {
    System.out.println("BACK_SLASH=" + yytext());
}
"=" {
    System.out.println("EQUAL=" + yytext());
}
"==" {
    System.out.println("DOUBLE_EQUAL=" + yytext());
}
"!=" {
    System.out.println("NOT_EQUAL=" + yytext());
}
"<" {
    System.out.println("LESS_THAN=" + yytext());
}
">" {
    System.out.println("GREATER_THAN=" + yytext());
}
"<=" {
    System.out.println("LESS_EQUAL=" + yytext());
}
">=" {
    System.out.println("GREATER_EQUAL=" + yytext());
}
"%" {
    System.out.println("MODULE=" + yytext());
}
"|" {
    System.out.println("PIPE=" + yytext());
}
"{" {
    System.out.println("LBRACE=" + yytext());
}
"}" {
    System.out.println("RBRACE=" + yytext());
}
"[" {
    System.out.println("LBRACKET=" + yytext());
}
"]" {
    System.out.println("RBRACKET=" + yytext());
}
"," {
    System.out.println("COMMA=" + yytext());
}
";" {
    System.out.println("SEMICOLON=" + yytext());
}
":" {
    System.out.println("COLON=" + yytext());
}
"." {
    System.out.println("DOT=" + yytext());
}
"^" {
    System.out.println("XOR_BITWISE=" + yytext());
}
"~" {
    System.out.println("NOT_BITWISE=" + yytext());
}
"<<" {
    System.out.println("SHIFT_LEFT=" + yytext());
}
">>" {
    System.out.println("SHIFT_RIGHT=" + yytext());
}
"&" {
    System.out.println("AND_BITWISE=" + yytext());
}

/* Cadenas */
\"([^\"\\\r\n]|\\.)*\" {
    System.out.println("STRING=" + yytext());
}
\'[^\'\n]*\' {
    System.out.println("STRING_SIMPLE=" + yytext());
}

/* Cualquier otro carácter no reconocido */
. {
    System.out.println("ERRORCITO=" + yytext());
}