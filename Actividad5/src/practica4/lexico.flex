/*ERICK ANTONIO LIMON GUEVARA*/
/*PIEDRA FLORES AXEL JESUS*/
/*LEONARDO JAVIER RODRIGUEZ MARTINEZ*/

package practica4;

/*Las importaciones necesarias*/
import java_cup.runtime.*;


%%

%public
%class LexicoPython
%unicode
%cup
%line
%column

%{
    // Función para reportar errores léxicos
    private void reportarError(String tipoError, String textoError, int linea, int columna, String descripcion) {
        System.out.println(
            tipoError + " '" + textoError + "' en la linea " + linea + ", columna " + columna + 
            ". Descripcion: " + descripcion
        );
    }
%}

%{ 
 private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
      } 
%}


%%


/* Salto de línea */
[\r\n]+ {
    System.out.println("NEWLINE=" + yytext());

}

/* Espacios (tabulaciones y espacios en blanco) */
[ \t\f]+ {
    System.out.println("WHITESPACE=" + yytext());
}



/* Palabras reservadas */
"True" {
    System.out.println("TRUE=" + yytext());
    return symbol(sym.TRUE, yytext());
}
"False" {
    System.out.println("FALSE=" + yytext());
    return symbol(sym.FALSE, yytext());
}
"None" {
    System.out.println("NONE=" + yytext());
    return symbol(sym.NONE, yytext());
}
"and" {
    System.out.println("AND=" + yytext());
    return symbol(sym.AND, yytext());
}
"or" {
    System.out.println("OR=" + yytext());
    return symbol(sym.OR, yytext());
}
"not" {
    System.out.println("NOT=" + yytext());
    return symbol(sym.NOT, yytext());
}
"is" {
    System.out.println("IS=" + yytext());
    return symbol(sym.IS, yytext());
}
"if" {
    System.out.println("IF=" + yytext());
    return symbol(sym.IF, yytext());
}
"else" {
    System.out.println("ELSE=" + yytext());
    return symbol(sym.ELSE, yytext());
}
"elif" {
    System.out.println("ELIF=" + yytext());
    return symbol(sym.ELIF, yytext());
}
"for" {
    System.out.println("FOR=" + yytext());
    return symbol(sym.FOR, yytext());
}
"while" {
    System.out.println("WHILE=" + yytext());
    return symbol(sym.WHILE, yytext());
}
"break" {
    System.out.println("BREAK=" + yytext());
    return symbol(sym.BREAK, yytext());
}
"continue" {
    System.out.println("CONTINUE=" + yytext());
    return symbol(sym.CONTINUE, yytext());
}
"pass" {
    System.out.println("PASS=" + yytext());
    return symbol(sym.PASS, yytext());
}
"try" {
    System.out.println("TRY=" + yytext());
    return symbol(sym.TRY, yytext());
}
"except" {
    System.out.println("EXCEPT=" + yytext());
    return symbol(sym.EXCEPT, yytext());
}
"finally" {
    System.out.println("FINALLY=" + yytext());
    return symbol(sym.FINALLY, yytext());
}
"raise" {
    System.out.println("RAISE=" + yytext());
    return symbol(sym.RAISE, yytext());
}

"def" {
    System.out.println("DEF=" + yytext());
    return symbol(sym.DEF, yytext());
}
"return" {
    System.out.println("RETURN=" + yytext());
    return symbol(sym.RETURN, yytext());
}

"class" {
    System.out.println("CLASS=" + yytext());
    return symbol(sym.CLASS, yytext());
}
"import" {
    System.out.println("IMPORT=" + yytext());
    return symbol(sym.IMPORT, yytext());
}
"from" {
    System.out.println("FROM=" + yytext());
    return symbol(sym.FROM, yytext());
}
"in" {
    System.out.println("IN=" + yytext());
    return symbol(sym.IN, yytext());
}
"as" {
    System.out.println("AS=" + yytext());
    return symbol(sym.AS, yytext());
}



/* Comentario */
"#".* {
    System.out.println("LINE_COMMENT=" + yytext());
}

/* Identificador */
[a-zA-Z_][a-zA-Z0-9_]* {
    System.out.println("IDENTIFIER=" + yytext());
    return symbol(sym.IDENTIFIER, yytext());
}



/* Números */
\d+ {
    System.out.println("INTEGER=" + yytext());
    return symbol(sym.INTEGER, yytext());
}

\d+\.\d+ {
    System.out.println("FLOAT=" + yytext());
    return symbol(sym.FLOAT, yytext());
}

/* Operadores relacionales, lógicos y aritméticos */
"+" {
    System.out.println("PLUS=" + yytext());
    return symbol(sym.PLUS, yytext());
}
"-" {
    System.out.println("MINUS=" + yytext());
    return symbol(sym.MINUS, yytext());
}
"*" {
    System.out.println("MULTIPLY=" + yytext());
    return symbol(sym.MULTIPLY, yytext());
}
"/" {
    System.out.println("DIVIDE=" + yytext());
    return symbol(sym.DIVIDE, yytext());
}
"\\" {
    System.out.println("BACK_SLASH=" + yytext());
    return symbol(sym.BACK_SLASH, yytext());
}
"=" {
    System.out.println("EQUAL=" + yytext());
    return symbol(sym.EQUAL, yytext());
}
"==" {
    System.out.println("DOUBLE_EQUAL=" + yytext());
    return symbol(sym.DOUBLE_EQUAL, yytext());
}
"!=" {
    System.out.println("NOT_EQUAL=" + yytext());
    return symbol(sym.NOT_EQUAL, yytext());
}
"<" {
    System.out.println("LESS_THAN=" + yytext());
    return symbol(sym.LESS_THAN, yytext());
}
">" {
    System.out.println("GREATER_THAN=" + yytext());
    return symbol(sym.GREATER_THAN, yytext());
}
"<=" {
    System.out.println("LESS_EQUAL=" + yytext());
    return symbol(sym.LESS_EQUAL, yytext());
}
">=" {
    System.out.println("GREATER_EQUAL=" + yytext());
    return symbol(sym.GREATER_EQUAL, yytext());
}
"%" {
    System.out.println("MODULE=" + yytext());
    return symbol(sym.MODULE, yytext());
}
"|" {
    System.out.println("PIPE=" + yytext());
    return symbol(sym.PIPE, yytext());
}

"(" {
    System.out.println("LPAREN=" + yytext());
    return symbol(sym.LPAREN, yytext());
}
")" {
    System.out.println("RPAREN=" + yytext());
    return symbol(sym.RPAREN, yytext());
}

"{" {
    System.out.println("LBRACE=" + yytext());
    return symbol(sym.LBRACE, yytext());
}
"}" {
    System.out.println("RBRACE=" + yytext());
    return symbol(sym.RBRACE, yytext());
}
"[" {
    System.out.println("LBRACKET=" + yytext());
    return symbol(sym.LBRACKET, yytext());
}
"]" {
    System.out.println("RBRACKET=" + yytext());
    return symbol(sym.RBRACKET, yytext());
}
"," {
    System.out.println("COMMA=" + yytext());
    return symbol(sym.COMMA, yytext());
}
";" {
    System.out.println("SEMICOLON=" + yytext());
    return symbol(sym.SEMICOLON, yytext());
}
":" {
    System.out.println("COLON=" + yytext());
    return symbol(sym.COLON, yytext());
}
"." {
    System.out.println("DOT=" + yytext());
    return symbol(sym.DOT, yytext());
}


/* Cadenas */
\"([^\"\\\r\n]|\\.)*\" {
    System.out.println("STRING=" + yytext());
    return symbol(sym.STRING, yytext());
}
\'[^\'\n]*\' {
    System.out.println("STRING_SIMPLE=" + yytext());
    return symbol(sym.STRING_SIMPLE, yytext());
}

/* Identificador mal formado (comienza con un numero o contiene caracteres no permitidos) */
[0-9]+[a-zA-Z_]+ {
    reportarError("Identificador mal formado", yytext(), yyline + 1, yycolumn + 1, 
                  "Los identificadores no pueden comenzar con un numero.");
    return symbol(sym.MALFORMED_IDENTIFIER, yytext());
}

/* Numero mal formado (multiples puntos decimales o caracteres no validos) */
\d+\.\d+\.\d+ {
    reportarError("Numero mal formado", yytext(), yyline + 1, yycolumn + 1, 
                  "Los numeros no pueden tener multiples puntos decimales.");
    return symbol(sym.MALFORMED_NUMBER, yytext());
}

/* Cadenas mal formadas (sin cerrar) */
\"([^\"\\]|\\.)* {
    reportarError("Cadena sin cerrar", yytext(), yyline + 1, yycolumn + 1, 
                  "La cadena de texto no se cerró correctamente. Falta la comilla doble de cierre (\").");
    return symbol(sym.UNCLOSED_STRING, yytext());
}

'([^'\\]|\\.)* {
    reportarError("Cadena simple sin cerrar", yytext(), yyline + 1, yycolumn + 1, 
                  "La cadena de texto no se cerró correctamente. Falta la comilla simple de cierre (').");
    return symbol(sym.UNCLOSED_STRING, yytext());
}


/* Cualquier otro carácter no reconocido */
. {
    reportarError("Caracter no reconocido", yytext(), yyline + 1, yycolumn + 1, 
                  "El caracter no es valido en el lenguaje.");
}




