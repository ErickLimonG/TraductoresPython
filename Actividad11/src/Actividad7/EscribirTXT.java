package Actividad7;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class EscribirTXT {

    private static final String RUTA = "C:\\Users\\erick\\Documents\\Code\\School\\TraductoresPython\\Actividad11\\src\\Actividad7\\intermedio.txt";

    public static void append(String texto) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(RUTA, true))) {
            bw.write(texto + "\n");
            bw.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
