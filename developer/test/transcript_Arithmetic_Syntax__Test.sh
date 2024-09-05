2024-09-05T01:46:03Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> make Arithmetic_Syntax__Test
mkdir -p ANTLR javac jvm
mkdir -p executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory Arithmetic_Syntax__Test
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
making grammar from: ANTLR/Arithmetic.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -o javac ANTLR/Arithmetic.g4
/bin/make -r --no-print-directory -f executor/makefile-project.mk executor/Arithmetic_Syntax__Test
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
Compiling javac/Arithmetic_Syntax__Test.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/Arithmetic_Syntax__Test.java
Created jvm/Arithmetic_Syntax__Test.class
Building Arithmetic_Syntax__Test...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/Arithmetic_Syntax__Test.jar -C jvm Arithmetic_Syntax__Test.class
Created jvm/Arithmetic_Syntax__Test.jar
Creating script for Arithmetic_Syntax__Test...
chmod +x executor/Arithmetic_Syntax__Test
Created script executor/Arithmetic_Syntax__Test

2024-09-05T01:46:11Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax__Test
Total tests run: 5
Total tests passed: 5
Total tests failed: 0

2024-09-05T01:46:16Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> 
