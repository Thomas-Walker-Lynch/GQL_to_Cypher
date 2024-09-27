#--------------------------------------------------------------------------------
# Project build
#
# GNU makefile

# turn off implicit rules, because they can do unexpected things.
.SUFFIXES:
MAKEFLAGS += -r

# `make` considers that PHONY targets do not correspond to files (other
# targets do and the files have their dates checked). This declaration renders
# innocuous the "feature" where `make` always tries to make its own
# makefiles. There is no command line switch to turn this "feature" off.
.PHONY: $(MAKEFILE_LIST)

# 'make' has a "feature" where it deletes what it determines to be intermediate
# files. There is no command line switch to turn this "feature" off. Combine
# this "feature" with implicit rules and have loads of fun.
.PRECIOUS: $(MAKEFILE_LIST)

#$(info makefile: $(MAKEFILE_LIST))
#$(info project_MAKECMDGOALS: $(MAKECMDGOALS))

# for recursive make without leaving this makefile
REMAKE = $(MAKE) -$(MAKEFLAGS) -f $(MAKEFILE_LIST)

#================================================================================
# Custom make targets
#

all: $(EXECUTOR_IN_FPL)


#-----------------------------------------------
# These do not require antlr generated java files

RuleNameListRegx: $(EXECUTOR_IN_DIR)/RuleNameListRegx
RuleNameList: $(EXECUTOR_IN_DIR)/RuleNameList

Synthesize_SyntaxAnnotate_PrintVisitorMethod:\
  $(JAVA_COMP_IN_PRIMARY_DIR)/StringUtils.java\
  $(EXECUTOR_IN_DIR)/Synthesize_SyntaxAnnotate_PrintVisitorMethod
Synthesize_SyntaxAnnotate_PrintVisitor:\
  $(JAVA_COMP_IN_PRIMARY_DIR)/StringUtils.java\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Synthesize_SyntaxAnnotate_PrintVisitorMethod.java\
  $(EXECUTOR_IN_DIR)/Synthesize_SyntaxAnnotate_PrintVisitor

Synthesize_SyntaxAnnotate:\
  $(JAVA_COMP_IN_PRIMARY_DIR)/StringUtils.java\https://github.com/Thomas-Walker-Lynch/GQL_to_Cypher
  $(EXECUTOR_IN_DIR)/Synthesize_SyntaxAnnotate

#-----------------------------------------------
# Arithmetic

ANTLR_OUT_Arithmetic_FPL:= $(shell ANTLR_OUT_FL Arithmetic -path $(ANTLR_OUT_DIR))
#$(info ANTLR_OUT_Arithmetic_FPL: $(ANTLR_OUT_Arithmetic_FPL))
Arithmetic_Echo:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Echo_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Echo

Arithmetic_Echo__Test:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Echo_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Echo__Test

Arithmetic_SyntaxAnnotate:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_SyntaxAnnotate

Arithmetic_SyntaxAnnotate__Test:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_SyntaxAnnotate__Test

Arithmetic_Swap:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_SwapVisitor.java\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Echo_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Swap

#-----------------------------------------------
# Arithmetic2
# 

ANTLR_OUT_Arithmetic2_FPL:= $(shell ANTLR_OUT_FL Arithmetic2 -path $(ANTLR_OUT_DIR))
Arithmetic2_SyntaxAnnotate:\
  $(ANTLR_OUT_Arithmetic2_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic2_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic2_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic2_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic2_SyntaxAnnotate

Arithmetic2_SyntaxAnnotate__Test:\
  $(ANTLR_OUT_Arithmetic2_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic2_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic2_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic2_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic2_SyntaxAnnotate__Test

#-----------------------------------------------
# Parsing/Analyzing ANTLR grammars
#

ANTLR_OUT_ANTLRv4_FPL:= $(shell ANTLR_OUT_FL ANTLRv4 -path $(ANTLR_OUT_DIR))
ANTLRv4_SyntaxAnnotate:\
  $(ANTLR_OUT_ANTLRv4_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/ANTLRv4_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_ANTLRv4_FPL)" ]; then \
	  echo "variable ANTLR_OUT_ANTLRv4_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/ANTLRv4_SyntaxAnnotate


#-----------------------------------------------
#  GQL_20240412

ANTLR_OUT_GQL_20240412_FPL := $(shell ANTLR_OUT_FL GQL_20240412 -path $(ANTLR_OUT_DIR))
GQL_20240412_SyntaxAnnotate:\
  $(ANTLR_OUT_GQL_20240412_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_SyntaxAnnotate

GQL_20240412_SyntaxAnnotate__Test: \
  $(ANTLR_OUT_GQL_20240412_FPL) \
  $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_SyntaxAnnotate_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_SyntaxAnnotate__Test


TerminalToCategory: 
	$(REMAKE) $(EXECUTOR_IN_DIR)/TerminalToCategory

GrammarSplitter: 
	$(REMAKE) $(EXECUTOR_IN_DIR)/GrammarSplitter

#-----------------------------------------------
# Compile all the .java files.

java: $(JAVA_COMP_OUT_FPL)


#================================================================================
# generic targets, aka recipes
#

# this section is not parallel make friendly
# $(ANTLR_OUT_DIR)/%Lexer.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<
# $(ANTLR_OUT_DIR)/%Parser.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<
# $(ANTLR_OUT_DIR)/%BaseListener.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<
# $(ANTLR_OUT_DIR)/%Listener.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<
# $(ANTLR_OUT_DIR)/%BaseVisitor.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<
# $(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
# 	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<

#--------------------
# for a single `<name>.g4` grammar file

$(ANTLR_OUT_DIR)/%Lexer.java \
$(ANTLR_OUT_DIR)/%Parser.java \
$(ANTLR_OUT_DIR)/%BaseListener.java \
$(ANTLR_OUT_DIR)/%Listener.java \
$(ANTLR_OUT_DIR)/%BaseVisitor.java \
$(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
	@echo "copiling grammar from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<

#--------------------
# For separate `<mame>Lexer.g4` and `<name>Parser.g4` files.
# `make` prefers shorter pattern matches, so this should work.
#

$(ANTLR_OUT_DIR)/LexerAdaptor.java: $(ANTLR_IN_PRIMARY_DIR)/LexerAdaptor.java
	cp $(ANTLR_IN_PRIMARY_DIR)/LexerAdaptor.java $(ANTLR_OUT_DIR)

$(ANTLR_OUT_DIR)/%Lexer.java: $(ANTLR_IN_PRIMARY_DIR)/%Lexer.g4 $(ANTLR_OUT_DIR)/LexerAdaptor.java
	@echo "making lexer grammar from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<

# Rule for all generated files from Parser.g4
$(ANTLR_OUT_DIR)/%Parser.java \
$(ANTLR_OUT_DIR)/%BaseListener.java \
$(ANTLR_OUT_DIR)/%Listener.java \
$(ANTLR_OUT_DIR)/%BaseVisitor.java \
$(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_PRIMARY_DIR)/%Parser.g4
	@echo "making other grammar files from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -lib $(ANTLR_OUT_DIR) -o $(ANTLR_OUT_DIR_PARENT) $<

#---------------------

# make .class file from .java file
$(JAVA_COMP_OUT_DIR)/%.class: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
	@echo "Compiling $<..."
	$(JAVA_COMP) -d $(JAVA_COMP_OUT_DIR) -sourcepath $(JAVA_COMP_IN_DL) $<
	@echo "Created $@"

# Without this, `make` sees .jar files as intermediate and deletes them.
.PRECIOUS: $(JAVA_COMP_OUT_DIR)/%.jar

# make .jar from .class file
$(JAVA_COMP_OUT_DIR)/%.class: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
$(JAVA_COMP_OUT_DIR)/%.jar: $(JAVA_COMP_OUT_DIR)/%.class
	@echo "Building $*..."
	$(JAVA_ARCHIVE) cf $@ -C $(JAVA_COMP_OUT_DIR) $*.class
	@echo "Created $@"

#make the wrapper script from the .jar file
$(EXECUTOR_IN_DIR)/%: $(JVM_IN_DIR)/%.jar
	@echo "Creating program for $*..."
	@echo "#!/usr/bin/env bash" > $(EXECUTOR_IN_DIR)/$*
	@echo "$(JAVA_INTERP) -cp ${CLASSPATH}:${JVM_IN_DP}:$(JVM_IN_DP)/$*.jar $*" \$$\@ >> $(EXECUTOR_IN_DIR)/$*
	chmod +x $(EXECUTOR_IN_DIR)/$*
	@echo "Created program $(EXECUTOR_IN_DIR)/$*"
