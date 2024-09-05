2024-09-05T01:03:35Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> make Arithmetic_Echo
mkdir -p ANTLR javac jvm
mkdir -p executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory Arithmetic_Echo
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
making grammar from: ANTLR/Arithmetic.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -o javac ANTLR/Arithmetic.g4
/bin/make -r --no-print-directory -f executor/makefile-project.mk executor/Arithmetic_Echo
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
Compiling javac/Arithmetic_Echo.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/Arithmetic_Echo.java
Created jvm/Arithmetic_Echo.class
Building Arithmetic_Echo...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/Arithmetic_Echo.jar -C jvm Arithmetic_Echo.class
Created jvm/Arithmetic_Echo.jar
Creating script for Arithmetic_Echo...
chmod +x executor/Arithmetic_Echo
Created script executor/Arithmetic_Echo

2024-09-05T01:03:43Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Echo Arithmetic_Syntax__Test_0.txt
(3 + 5)

2024-09-05T01:04:01Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Echo Arithmetic_Syntax__Test_1.txt
(3 + 5)

2024-09-05T01:04:05Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Echo Arithmetic_Syntax__Test_2.txt
(2 * (3 + 4))

2024-09-05T01:04:11Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Echo Arithmetic_Syntax__Test_3.txt
(10 / 2)

2024-09-05T01:04:14Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Echo Arithmetic_Syntax__Test_4.txt
(3 + (5 * (10 - 4)))

2024-09-05T01:05:11Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> clean program Arithmetic_Echo
Deleting program files for 'Arithmetic_Echo'

2024-09-05T01:05:23Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
>
