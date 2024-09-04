#--------------------------------------------------------------------------------
#  Project build
#

# turn off implicit rules
.SUFFIXES:
MAKEFLAGS += -r

# `make` always tries to make its makefiles as targets. This prevents that.
.PHONY: $(MAKEFILE_LIST)
.PRECIOUS: $(MAKEFILE_LIST)

$(info makefile: $(MAKEFILE_LIST))
$(info project_MAKECMDGOALS: $(MAKECMDGOALS))

#================================================================================
# Custom make targets
#

project: $(EXECUTOR_IN_FPL)
PrintRuleNameList: $(EXECUTOR_IN_DIR)/PrintRuleNameList


#-----------------------------------------------
# Arithmetic

ANTLR_OUT_Arithmetic_FPL $(shell ANTLR_OUT_FL Arithmetic -path $(ANTLR_OUT_DIR))
Arithmetic_Echo:\
  $(ANTLR_OUT_Arithmetic_FPL)
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Echo_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	make $(EXECUTOR_IN_DIR)/Arithmetic_Echo

Arithmetic_Echo__Test:\
  $(ANTLR_OUT_Arithmetic_FPL)
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Echo_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Echo__Test

Arithmetic_Syntax:\
  $(ANTLR_OUT_Arithmetic_FPL)
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Syntax

Arithmetic_Syntax__Test:\
  $(ANTLR_OUT_Arithmetic_FPL)
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Syntax__Test

#-----------------------------------------------
#  GQL_20240412

ANTLR_OUT_GQL_20240412_FPL := $(shell ANTLR_OUT_FL GQL_20240412 -path $(ANTLR_OUT_DIR))
GQL_20240412_Syntax: $(ANTLR_OUT_GQL_20240412_FPL) $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_Syntax

GQL_20240412_Syntax__Test: $(ANTLR_OUT_GQL_20240412_FPL) $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_Syntax__Test

TerminalToCategory: 
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/TerminalToCategory

GrammarSplitter: 
	$(BIN_MAKE) $(EXECUTOR_IN_DIR)/GrammarSplitter

#-----------------------------------------------
# Compile all the .java files.

java: $(JAVA_COMP_OUT_FPL)


#================================================================================
# generic targets, aka recipes
#

$(ANTLR_OUT_DIR)/%Lexer.java \
$(ANTLR_OUT_DIR)/%Lexer.tokens \
$(ANTLR_OUT_DIR)/%Parser.java \
$(ANTLR_OUT_DIR)/%Parser.tokens \
$(ANTLR_OUT_DIR)/%BaseListener.java \
$(ANTLR_OUT_DIR)/%Listener.java \
$(ANTLR_OUT_DIR)/%BaseVisitor.java \
$(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_PRIMARY_FPL)
	@echo "making grammar from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<

# Rule to build .class files from .java files
$(JAVA_COMP_OUT_DIR)/%.class: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
	@echo "Compiling $<..."
	$(JAVA_COMP) -d $(JAVA_COMP_OUT_DIR) -sourcepath $(JAVA_COMP_IN_DL) $<
	@echo "Created $@"

# Without this, GNU make inserts an 'rm -rf' not on the recipe and deletes the .jar files
# after making them.  Why make why?
.PRECIOUS: $(JAVA_COMP_OUT_DIR)/%.jar
# Rule to build .jar files from .class files
$(JAVA_COMP_OUT_DIR)/%.jar: $(JAVA_COMP_OUT_DIR)/%.class
	@echo "Building $*..."
	$(JAVA_ARCHIVE) cf $@ -C $(JAVA_COMP_OUT_DIR) $*.class
	@echo "Created $@"

$(EXECUTOR_IN_DIR)/%: $(JVM_IN_DIR)/%.jar
	@echo "Creating script for $*..."
	@echo "#!/usr/bin/env bash" > $(EXECUTOR_IN_DIR)/$*
	@echo "$(JAVA_INTERP) -cp ${CLASSPATH}:${JVM_IN_DP}:$(JVM_IN_DP)/$*.jar $*" \$$\@ >> $(EXECUTOR_IN_DIR)/$*
	chmod +x $(EXECUTOR_IN_DIR)/$*
	@echo "Created script $(EXECUTOR_IN_DIR)/$*"
