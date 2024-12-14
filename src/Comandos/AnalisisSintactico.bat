
SET JAVA_HOME="C:\Program Files\Java\jdk-21\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd "C:\Users\Dylan MA\OneDrive - Estudiantes ITCR\TEC\VERANO 2024\Compiladores e Interpretes\Proyecto1_Compiladores\Proyecto1_CI\src\CUP"
java -jar "C:\Users\Dylan MA\OneDrive - Estudiantes ITCR\TEC\VERANO 2024\Compiladores e Interpretes\Instalaciones\java-cup-11b.jar" -parser Parser -symbols sym Parser.cup
pause