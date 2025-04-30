package Actividad7;

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class TablaSimbolos {
    final String RESET = "\033[0m";
    final String ROJO = "\033[31m";
    final String VERDE = "\033[32m";
    final String AMARILLO = "\033[33m";
    final String CIAN = "\033[36m";
    private Map<String, Simbolo> tabla;
    private Map<String, List<String>> parametrosMetodos; // Almacena parámetros por método

    public TablaSimbolos() {
        tabla = new HashMap<>();
        parametrosMetodos = new HashMap<>();
    }

    public boolean agregar(String nombre, Simbolo simbolo) {
        if (tabla.containsKey(nombre)) {
            tabla.remove(nombre);
            tabla.put(nombre, simbolo);
            System.out.println(CIAN + "ACTUALIZACION DE VARIABLE" + RESET);
            return true;
        } else {
            tabla.put(nombre, simbolo);
            return true;
        }
    }

    public boolean agregarMetodo(String nombreMetodo, String parametrosStr, Simbolo simbolo) {
        if (tabla.containsKey(nombreMetodo)) {
            System.out.println(ROJO + "Error: Método '" + nombreMetodo + "' ya existe" + RESET);
            return false;
        }

        // Procesar el string de parámetros
        List<String> parametros = new ArrayList<>();
        if (parametrosStr != null && !parametrosStr.trim().isEmpty()) {
            // Dividir por comas y eliminar espacios en blanco
            String[] paramsArray = parametrosStr.split("\\s*,\\s*");
            for (String param : paramsArray) {
                if (!param.trim().isEmpty()) {
                    parametros.add(param.trim());
                }
            }
        }

        tabla.put(nombreMetodo, simbolo);
        parametrosMetodos.put(nombreMetodo, parametros);

        // Agregar cada parámetro como variable
        for (String param : parametros) {
            Simbolo simboloParam = new Simbolo(param, "parametro", "0", "parametro");
            if (tabla.containsKey(param)) {
                System.out.println(CIAN + "Advertencia: El parámetro '" + param +
                        "' ya existe y será sobrescrito" + RESET);
            }
            tabla.put(param, simboloParam);
        }

        System.out.println(VERDE + "Método '" + nombreMetodo + "' agregado con " +
                parametros.size() + " parámetros" + RESET);
        return true;
    }

    public boolean verificar(String nombre) {
        return tabla.containsKey(nombre);
    }

    public Simbolo obtenerSimbolo(String nombre) {
        return tabla.get(nombre);
    }

    public String mostrar() {
        StringBuilder simbolos = new StringBuilder();
        for (Map.Entry<String, Simbolo> entry : tabla.entrySet()) {
            simbolos.append(AMARILLO).append(entry.getValue()).append(RESET);

            // Si es un metodo, mostrar sus parámetros
            if (parametrosMetodos.containsKey(entry.getKey())) {
                simbolos.append(" - Parámetros: ").append(parametrosMetodos.get(entry.getKey()));
            }

            simbolos.append("\n");
        }
        return simbolos.toString();
    }

    public Simbolo buscar(String nombre) {
        return tabla.get(nombre);
    }

    // Obtener parámetros de un metodo
    public List<String> obtenerParametrosMetodo(String nombreMetodo) {
        return parametrosMetodos.getOrDefault(nombreMetodo, new ArrayList<>());
    }

    public int obtenerNumeroParametros(String nombreMetodo) {
        if (!parametrosMetodos.containsKey(nombreMetodo)) {
            return -1; // Método no encontrado
        }
        return parametrosMetodos.get(nombreMetodo).size();
    }

    // Verificar si un nombre corresponde a un parámetro de metodo
    public boolean esParametro(String nombre) {
        Simbolo s = tabla.get(nombre);
        return s != null && "parametro".equals(s.getTipo());
    }
}