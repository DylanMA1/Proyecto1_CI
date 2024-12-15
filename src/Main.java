import java_cup.runtime.Symbol;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;
import JFLEX.Lexer;
import CUP.sym;

/**
 * Clase principal que realiza el análisis léxico de un archivo de texto
 * utilizando un lexer generado por JFlex y la librería CUP.
 *
 * El programa lee un archivo de entrada, realiza el análisis léxico token por token,
 * y escribe los resultados (tokens, tipo, línea, columna) en un archivo de salida.
 */
public class Main {

    /**
     * Método principal que ejecuta el análisis léxico.
     *
     * @param args Argumentos de línea de comandos. Si no se proporciona un archivo como argumento,
     *             se utilizará un archivo por defecto en la ruta especificada.
     */
    public static void main(String[] args) {
        String archivo;

        // Verifica si se pasó un archivo como argumento
        if (args.length != 1) {
            // Si no se pasó archivo, usa la ruta por defecto
            archivo = "C:\\Users\\Dylan MA\\OneDrive - Estudiantes ITCR\\TEC\\VERANO 2024\\Compiladores e Interpretes\\Proyecto1_Compiladores\\Proyecto1_CI\\src\\Prueba.txt";
        } else {
            // Usa el archivo pasado como argumento
            archivo = args[0];
        }
        // Archivo donde se guardarán los resultados del análisis léxico
        String archivoSalida = "salida.txt";

        // Bloque try-with-resources para manejar los recursos de entrada y salida
        try (FileReader reader = new FileReader(archivo);
             BufferedWriter writer = new BufferedWriter(new FileWriter(archivoSalida, false))) {

            // Crea una instancia del lexer que procesará el archivo de entrada
            Lexer lexer = new Lexer(reader);

            Symbol token;
            // Comienza el análisis léxico
            while (true) {
                // Obtiene el siguiente token
                token = lexer.next_token();

                // Si el token no es nulo, procesa la información del token
                if (token.sym != 0) {
                    // Obtiene el nombre del token a partir del símbolo
                    String tokenName = sym.terminalNames[token.sym];

                    // Obtiene la línea y la columna en la que se encontró el token
                    int linea = lexer.getLine() + 1;
                    int columna = lexer.getColumn() + 1;

                    // Imprime la información del token en la consola
                    System.out.println("Token: " + tokenName + ", Tipo: " + token.sym + ", Línea: " + linea + ", Columna: " + columna);
                    // Escribe la información del token en el archivo de salida
                    writer.write("Token: " + tokenName + ", Tipo: " + token.sym + ", Línea: " + linea + ", Columna: " + columna + "\n");

                } else {
                    // Si se alcanza el final del archivo, se termina el análisis
                    System.out.println("Análisis terminado: se alcanzó el final del archivo.");
                    break;
                }
            }
        } catch (IOException e) {
            // Maneja errores de lectura del archivo
            System.err.println("Error al leer el archivo: " + e.getMessage());
        } catch (Exception e) {
            // Maneja otros errores durante el análisis léxico
            System.err.println("Error durante el análisis léxico: " + e.getMessage());
        }
    }
}
