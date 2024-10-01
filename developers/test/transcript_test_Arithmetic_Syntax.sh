2024-09-05T01:05:48Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> make Arithmetic_Syntax
mkdir -p ANTLR javac jvm
mkdir -p executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory Arithmetic_Syntax
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
making grammar from: ANTLR/Arithmetic.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -o javac ANTLR/Arithmetic.g4
/bin/make -r --no-print-directory -f executor/makefile-project.mk executor/Arithmetic_Syntax
ANTLR_OUT_Arithmetic_FPL: javac/ANTLR/ArithmeticLexer.java javac/ANTLR/ArithmeticParser.java javac/ANTLR/ArithmeticVisitor.java javac/ANTLR/ArithmeticBaseVisitor.java
Compiling javac/Arithmetic_Syntax.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/Arithmetic_Syntax.java
Created jvm/Arithmetic_Syntax.class
Building Arithmetic_Syntax...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/Arithmetic_Syntax.jar -C jvm Arithmetic_Syntax.class
Created jvm/Arithmetic_Syntax.jar
Creating script for Arithmetic_Syntax...
chmod +x executor/Arithmetic_Syntax
Created script executor/Arithmetic_Syntax

2024-09-05T01:06:00Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax -pp Arithmetic_Syntax__Test_0.txt 
program
  expression(
    expression(
      INT(3)
    )
    operator(+)
    expression(
      INT(5)
    )
  )


2024-09-05T01:06:28Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax -pp Arithmetic_Syntax__Test_1.txt 
program
  expression(
    expression(
      INT(3)
    )
    operator(+)
    expression(
      INT(5)
    )
  )


2024-09-05T01:06:41Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax -pp Arithmetic_Syntax__Test_2.txt 
program
  expression(
    expression(
      INT(2)
    )
    operator(*)
    expression(
      (
        expression(
          expression(
            INT(3)
          )
          operator(+)
          expression(
            INT(4)
          )
        )
      )
    )
  )


2024-09-05T01:06:46Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax -pp Arithmetic_Syntax__Test_3.txt 
program
  expression(
    expression(
      INT(10)
    )
    operator(/)
    expression(
      INT(2)
    )
  )


2024-09-05T01:06:50Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax -pp Arithmetic_Syntax__Test_4.txt 
program
  expression(
    expression(
      INT(3)
    )
    operator(+)
    expression(
      expression(
        INT(5)
      )
      operator(*)
      expression(
        (
          expression(
            expression(
              INT(10)
            )
            operator(-)
            expression(
              INT(4)
            )
          )
        )
      )
    )
  )


2024-09-05T01:06:57Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax Arithmetic_Syntax__Test_0.txt 
program(expression(INT(3) operator(+) INT(5)))

2024-09-05T01:07:12Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax Arithmetic_Syntax__Test_1.txt 
program(expression(INT(3) operator(+) INT(5)))

2024-09-05T01:07:17Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax Arithmetic_Syntax__Test_2.txt 
program(expression(INT(2) operator(*) (expression(INT(3) operator(+) INT(4)))))

2024-09-05T01:07:21Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax Arithmetic_Syntax__Test_3.txt 
program(expression(INT(10) operator(/) INT(2)))

2024-09-05T01:07:24Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> Arithmetic_Syntax Arithmetic_Syntax__Test_4.txt 
program(expression(INT(3) operator(+) expression(INT(5) operator(*) (expression(INT(10) operator(-) INT(4))))))

2024-09-05T01:07:29Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> clean program Arithmetic_Syntax
Deleting program files for 'Arithmetic_Syntax'

2024-09-05T01:07:53Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> 
