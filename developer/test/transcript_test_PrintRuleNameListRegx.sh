2024-09-05T02:06:09Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> cd test

2024-09-05T02:06:11Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> PrintRuleNameListRegx
bash: /var/user_data/Thomas-developer/GQL_to_Cypher/developer/executor/PrintRuleNameListRegx: No such file or directory

2024-09-05T02:06:18Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> make PrintRuleNameListRegx
mkdir -p ANTLR javac jvm
mkdir -p executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory PrintRuleNameListRegx
Compiling javac/PrintRuleNameListRegx.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/PrintRuleNameListRegx.java
Created jvm/PrintRuleNameListRegx.class
Building PrintRuleNameListRegx...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/PrintRuleNameListRegx.jar -C jvm PrintRuleNameListRegx.class
Created jvm/PrintRuleNameListRegx.jar
Creating script for PrintRuleNameListRegx...
chmod +x executor/PrintRuleNameListRegx
Created script executor/PrintRuleNameListRegx

2024-09-05T02:06:39Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> PrintRuleNameListRegx
Usage: PrintRuleNameListRegx <path-to-g4-file>

2024-09-05T02:06:44Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> PrintRuleNameListRegx ../ANTLR/Arithmetic.g4 
Extracted Rules:
expression
program
WS
INT

2024-09-05T02:06:53Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> clean PrintRuleNameListRegx
Unknown clean option: PrintRuleNameListRegx

2024-09-05T02:07:18Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
> clean program PrintRuleNameListRegx
Deleting program files for 'PrintRuleNameListRegx'

2024-09-05T02:07:25Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer/test§
>

