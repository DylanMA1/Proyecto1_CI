REM Establecer la variable JAVA_HOME
SET JAVA_HOME="C:\Program Files\Java\jdk-21\bin"

SET PATH=%JAVA_HOME%;%PATH%

cd "C:\Users\Dylan MA\OneDrive - Estudiantes ITCR\TEC\VERANO 2024\Compiladores e Interpretes\Proyecto1_CI\Proyecto1_CI\src"

javac JFLEX/Lexer.java Main/App.java

java Main.App "C:\Users\Dylan MA\OneDrive - Estudiantes ITCR\TEC\VERANO 2024\Compiladores e Interpretes\Proyecto1_CI\Proyecto1_CI\src\Main\codigoPrueba.txt"

pause