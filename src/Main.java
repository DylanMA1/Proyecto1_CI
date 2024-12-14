import java_cup.runtime.Symbol;

import java.io.FileReader;
import java.io.IOException;
import JFLEX.Lexer;
import java_cup.runtime.Symbol;

public class Main {

    public static void main(String[] args) {

        if (args.length != 1) {
            System.out.println("Por favor, proporciona la ruta del archivo a analizar.");
            return;
        }

        String archivo = args[0];

        try (FileReader reader = new FileReader(archivo)) {

            Lexer lexer = new Lexer(reader);

            Symbol token;
            while ((token = lexer.next_token()) != null) {
                System.out.println("Token: " + token.toString() + ", Tipo: " + token.sym);
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error durante el análisis léxico: " + e.getMessage());
        }
    }
}
