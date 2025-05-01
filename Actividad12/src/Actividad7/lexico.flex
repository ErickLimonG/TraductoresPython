package Actividad7;

/* Las importaciones necesarias */
import java_cup.runtime.*;
import java.util.Stack;

%%

%public
%class LexicoPython
%unicode
%cup
%line
%column

%{
    // Stack to keep track of indentation levels
    private Stack<Integer> indentationStack = new Stack<>();
    private int currentIndentation = 0;

    // Función para reportar errores léxicos
    private void reportarError(String tipoError, String textoError, int linea, int columna, String descripcion) {
        System.out.println((
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
    ////System.out.println(("NEWLINE=" + yytext());
}

/* Espacios (tabulaciones y espacios en blanco) */
^[ \t]+ {
    int newIndentation = yytext().length();
    //System.out.println(("Handling indentation: newIndentation=" + newIndentation + ", currentIndentation=" + currentIndentation);

    if (newIndentation > currentIndentation) {
        // Increase indentation level
        currentIndentation = newIndentation;
        indentationStack.push(currentIndentation);
        //System.out.println(("INDENT");
        return symbol(sym.INDENT, yytext());
    } else if (newIndentation < currentIndentation) {
        // Decrease indentation level
        currentIndentation = newIndentation;
        // Generate DEDENT tokens for each level of indentation removed
        while (!indentationStack.isEmpty() && indentationStack.peek() > currentIndentation) {
            indentationStack.pop();
            //System.out.println(("DEDENT");
            // Return a DEDENT token for each level
            return symbol(sym.DEDENT, yytext());
        }
    }
}

[ \t]+ {
    ////System.out.println(("Non-leading spaces/tabs: '" + yytext() + "'");
}

/* Palabras reservadas */
"_" { return symbol(sym.DEFAULT, yytext()); }
"match" { return symbol(sym.MATCH, yytext()); }
"case" { return symbol(sym.CASE, yytext()); }
"range" { return symbol(sym.RANGE, yytext()); }
"True" { return symbol(sym.TRUE, yytext()); }
"False" { return symbol(sym.FALSE, yytext()); }
"None" { return symbol(sym.NONE, yytext()); }
"and" { return symbol(sym.AND, yytext()); }
"or" { return symbol(sym.OR, yytext()); }
"not" { return symbol(sym.NOT, yytext()); }
"is" { return symbol(sym.IS, yytext()); }
"if" { return symbol(sym.IF, yytext()); }
"else" { return symbol(sym.ELSE, yytext()); }
"elif" { return symbol(sym.ELIF, yytext()); }
"for" { return symbol(sym.FOR, yytext()); }
"while" { return symbol(sym.WHILE, yytext()); }
"break" { return symbol(sym.BREAK, yytext()); }
"continue" { return symbol(sym.CONTINUE, yytext()); }
"pass" { return symbol(sym.PASS, yytext()); }
"try" { return symbol(sym.TRY, yytext()); }
"except" { return symbol(sym.EXCEPT, yytext()); }
"finally" { return symbol(sym.FINALLY, yytext()); }
"raise" { return symbol(sym.RAISE, yytext()); }
"def" { return symbol(sym.DEF, yytext()); }
"return" { return symbol(sym.RETURN, yytext()); }
"class" { return symbol(sym.CLASS, yytext()); }
"import" { return symbol(sym.IMPORT, yytext()); }
"from" { return symbol(sym.FROM, yytext()); }
"in" { return symbol(sym.IN, yytext()); }
"as" { return symbol(sym.AS, yytext()); }
"self" { return symbol(sym.THIS, yytext()); }

/* Casting */
"int" { return symbol(sym.CAST_INT, yytext()); }
"float" { return symbol(sym.CAST_FLOAT, yytext()); }
"bool" { return symbol(sym.CAST_BOOL, yytext()); }
"str" { return symbol(sym.CAST_STR, yytext()); }

/* Comentario */
"#".* { /*//System.out.println(("LINE_COMMENT=" + yytext());*/ }

/* Identificador */
[a-zA-Z_][a-zA-Z0-9_]* { return symbol(sym.IDENTIFIER, yytext()); }

/* Números */
\d+ { return symbol(sym.INTEGER, yytext()); }
\d+\.\d+ { return symbol(sym.FLOAT, yytext()); }

/* Operadores relacionales, lógicos y aritméticos */
"+" { return symbol(sym.PLUS, yytext()); }
"-" { return symbol(sym.MINUS, yytext()); }
"*" { return symbol(sym.MULTIPLY, yytext()); }
"/" { return symbol(sym.DIVIDE, yytext()); }
"\\" { return symbol(sym.BACK_SLASH, yytext()); }
"=" { return symbol(sym.EQUAL, yytext()); }
"==" { return symbol(sym.DOUBLE_EQUAL, yytext()); }
"!=" { return symbol(sym.NOT_EQUAL, yytext()); }
"<" { return symbol(sym.LESS_THAN, yytext()); }
">" { return symbol(sym.GREATER_THAN, yytext()); }
"<=" { return symbol(sym.LESS_EQUAL, yytext()); }
">=" { return symbol(sym.GREATER_EQUAL, yytext()); }
"%" { return symbol(sym.MODULE, yytext()); }
"|" { return symbol(sym.PIPE, yytext()); }

/* Símbolos */
"(" { return symbol(sym.LPAREN, yytext()); }
")" { return symbol(sym.RPAREN, yytext()); }
"{" { return symbol(sym.LBRACE, yytext()); }
"}" { return symbol(sym.RBRACE, yytext()); }
"[" { return symbol(sym.LBRACKET, yytext()); }
"]" { return symbol(sym.RBRACKET, yytext()); }
"," { return symbol(sym.COMMA, yytext()); }
";" { return symbol(sym.SEMICOLON, yytext()); }
":" { return symbol(sym.COLON, yytext()); }
"." { return symbol(sym.DOT, yytext()); }
"print" { return symbol(sym.PRINT, yytext()); }

/* Cadenas */
\"([^\"\\\r\n]|\\.)*\" { return symbol(sym.STRING, yytext()); }
\'[^\'\n]*\' { return symbol(sym.STRING_SIMPLE, yytext()); }

/* Identificador mal formado */
[0-9]+[a-zA-Z_]+ {
    reportarError("Identificador mal formado", yytext(), yyline + 1, yycolumn + 1, 
                  "Los identificadores no pueden comenzar con un numero.");
    return symbol(sym.MALFORMED_IDENTIFIER, yytext());
}

/* Numero mal formado */
\d+\.\d+\.\d+ {
    reportarError("Numero mal formado", yytext(), yyline + 1, yycolumn + 1, 
                  "Los numeros no pueden tener multiples puntos decimales.");
    return symbol(sym.MALFORMED_NUMBER, yytext());
}

/* Cadenas mal formadas */
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

<<EOF>> {
    // Generate DEDENT tokens for all remaining indentation levels
    while (!indentationStack.isEmpty()) {
        indentationStack.pop();
        //System.out.println(("DEDENT (EOF)");
        return symbol(sym.DEDENT, "");
    }
    return symbol(sym.EOF, "");
}

/* Cualquier otro carácter no reconocido */
. {
    reportarError("Caracter no reconocido", yytext(), yyline + 1, yycolumn + 1, 
                  "El caracter no es valido en el lenguaje.");
}