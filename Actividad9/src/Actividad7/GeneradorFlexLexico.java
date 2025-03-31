/*ERICK ANTONIO LIMON GUEVARA*/
/*PIEDRA FLORES AXEL JESUS*/
/*LEONARDO JAVIER RODRIGUEZ MARTINEZ*/
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Actividad7;

import jflex.Main;

/**
 *
 * @author Alumno
 */
public class GeneradorFlexLexico {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String rutaFlex="src/Actividad7/lexico.flex";
        
        
            String[] jflexArgs = { rutaFlex };
            try {
               Main.generate(jflexArgs);
               System.out.println("Lexer generado con exito");
               }
            
            catch (Exception e)
             {
              System.err.println("Error al generar el lexico");
              e.printStackTrace();
              System.exit(1);
             }
    }   
}
