/*ERICK ANTONIO LIMON GUEVARA*/
/*PIEDRA FLORES AXEL JESUS*/
/*LEONARDO JAVIER RODRIGUEZ MARTINEZ*/
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica2;

import java.io.FileReader;
import java.io.Reader;
import java_cup.runtime.Symbol;

/**
 *
 * @author Alumno
 */
public class AnalisisLexicoPython {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String test = "src/practica2/tokens.txt";
        System.out.println("PIEDRA FLORES AXEL JESUS");
        System.out.println("LIMON GUEVARA ERICK ANTONIO");
        System.out.println("RODRIGUEZ MARTINEZ LEONARDO JAVIER");

        try (Reader reader = new FileReader(test)){
            //crear la instancia del lexer directamente
            LexicoPython lexer = new LexicoPython(reader);
            //Leer tokens y procesarlos
            Symbol token;
            while ((token = lexer.next_token()).sym != sym.EOF){
                System.out.println("Token: "+token);
                System.out.println("");
            }
            
            System.out.println("Fin del archivo");
        } catch (Exception e){
            System.err.println("Error al leer el archivo de prueba.");
            e.printStackTrace();
        }
        
        System.out.println("PIEDRA FLORES AXEL JESUS");
        System.out.println("LIMON GUEVARA ERICK ANTONIO");
        System.out.println("RODRIGUEZ MARTINEZ LEONARDO JAVIER");
    }
    
    
}
