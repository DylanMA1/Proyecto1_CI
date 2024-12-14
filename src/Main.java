import java_cup.runtime.Symbol;

import java.io.FileReader;
import java.io.IOException;
import JFLEX.Lexer;
import CUP.sym;

public class Main {

    public static void main(String[] args) {
        String archivo;

        if (args.length != 1) {
            archivo = "C:\\Users\\Dylan MA\\OneDrive - Estudiantes ITCR\\TEC\\VERANO 2024\\Compiladores e Interpretes\\Proyecto1_Compiladores\\Proyecto1_CI\\src\\Prueba.txt";
        } else {
            archivo = args[0];
        }

        try (FileReader reader = new FileReader(archivo)) {
            Lexer lexer = new Lexer(reader);

            Symbol token;
            while (true) {
                token = lexer.next_token();

                if (token.sym != 0) {
                    String tokenName = sym.terminalNames[token.sym];
                    System.out.println("Token: " + tokenName + ", Tipo: " + token.sym);
                } else {
                    System.out.println("Análisis terminado: se alcanzó el final del archivo.");
                    break;
                }
            }
        } catch (IOException e) {
            System.err.println("Error al leer el archivo: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error durante el análisis léxico: " + e.getMessage());
        }
    }
}