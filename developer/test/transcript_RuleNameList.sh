2024-09-05T07:24:43Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> make Arithmetic_Echo
mkdir -p ANTLR javac jvm executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory Arithmetic_Echo
copiling grammar from: ANTLR/Arithmetic.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -o javac ANTLR/Arithmetic.g4
/bin/make -r --no-print-directory -f executor/makefile-project.mk executor/Arithmetic_Echo
Compiling javac/Arithmetic_Echo.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/Arithmetic_Echo.java
Created jvm/Arithmetic_Echo.class
Building Arithmetic_Echo...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/Arithmetic_Echo.jar -C jvm Arithmetic_Echo.class
Created jvm/Arithmetic_Echo.jar
Creating script for Arithmetic_Echo...
chmod +x executor/Arithmetic_Echo
Created script executor/Arithmetic_Echo

 [cut]

2024-09-05T07:26:04Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> make RuleNameList
mkdir -p ANTLR javac jvm executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory RuleNameList
Compiling javac/RuleNameList.java...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/javac -d jvm -sourcepath javac:javac/ANTLR javac/RuleNameList.java
Created jvm/RuleNameList.class
Building RuleNameList...
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/jar cf jvm/RuleNameList.jar -C jvm RuleNameList.class
Created jvm/RuleNameList.jar
Creating script for RuleNameList...
chmod +x executor/RuleNameList
Created script executor/RuleNameList

2024-09-05T07:28:47Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> RuleNameList Arithmetic
Rule names found in the grammar:
program
expression

2024-09-05T07:29:09Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> make ANTLRv4_Syntax
mkdir -p ANTLR javac jvm executor test deprecated experiment ologist temporary
/bin/make -f executor/makefile-tool.mk -r --no-print-directory all
make[1]: Nothing to be done for 'all'.
/bin/make -f executor/makefile-project.mk -r --no-print-directory ANTLRv4_Syntax
making lexer grammar from: ANTLR/ANTLRv4Lexer.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -o javac ANTLR/ANTLRv4Lexer.g4
making other grammar files from: ANTLR/ANTLRv4Parser.g4
/var/user_data/Thomas-developer/GQL_to_Cypher/tool/jdk-22.0.1+8/bin/java -jar /var/user_data/Thomas-developer/GQL_to_Cypher/tool/executor/antlr-4.11.1-complete.jar -Dlanguage=Java -visitor -lib javac/ANTLR -o javac ANTLR/ANTLRv4Parser.g4
executor/makefile-project.mk:179: warning: pattern recipe did not update peer target 'javac/ANTLR/ANTLRv4Visitor.java'.
executor/makefile-project.mk:179: warning: pattern recipe did not update peer target 'javac/ANTLR/ANTLRv4BaseVisitor.java'.
executor/makefile-project.mk:179: warning: pattern recipe did not update peer target 'javac/ANTLR/ANTLRv4Listener.java'.
executor/makefile-project.mk:179: warning: pattern recipe did not update peer target 'javac/ANTLR/ANTLRv4BaseListener.java'.
/bin/make -r --no-print-directory -f executor/makefile-project.mk executor/ANTLRv4_Syntax
Compiling javac/ANTLRv4_Syntax.java...

 [ had errors, but we only need the grammar to be made ]

2024-09-05T07:31:03Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> RuleNameList ANTLRv4
Rule names found in the grammar:
grammarSpec
grammarDecl
grammarType
prequelConstruct
optionsSpec
option
optionValue
delegateGrammars
delegateGrammar
tokensSpec
channelsSpec
idList
action_
actionScopeName
actionBlock
argActionBlock
modeSpec
rules
ruleSpec
parserRuleSpec
exceptionGroup
exceptionHandler
finallyClause
rulePrequel
ruleReturns
throwsSpec
localsSpec
ruleAction
ruleModifiers
ruleModifier
ruleBlock
ruleAltList
labeledAlt
lexerRuleSpec
lexerRuleBlock
lexerAltList
lexerAlt
lexerElements
lexerElement
lexerBlock
lexerCommands
lexerCommand
lexerCommandName
lexerCommandExpr
altList
alternative
element
predicateOptions
predicateOption
labeledElement
ebnf
blockSuffix
ebnfSuffix
lexerAtom
atom
notSet
blockSet
setElement
block
ruleref
characterRange
terminalDef
elementOptions
elementOption
identifier

2024-09-05T07:31:24Z[GQL_to_Cypher]
Thomas-developer@Vivobook12§/var/user_data/Thomas-developer/GQL_to_Cypher/developer§
> 
