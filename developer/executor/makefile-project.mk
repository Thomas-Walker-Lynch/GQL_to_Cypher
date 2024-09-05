#--------------------------------------------------------------------------------
#  Project build
#

# turn off implicit rules, because they can do unexpected things.
.SUFFIXES:
MAKEFLAGS += -r

# Turns off the "feature" where `make` tries to make its makefiles as file targets. There
# is no command line switch to turn this off.
.PHONY: $(MAKEFILE_LIST)

# 'make' has a "feature" where it deletes what it determines to be intermediate
# files.  There is no command line switch to turn this behavior off. Combine
# this feature with implicit rules to have loads of fun. At least this prevents
# make from deleting its makefiles if it happens to decide one is an
# intermediate file.
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
# A utility for viewing all the rules in a grammar

PrintRuleNameListRegx: $(EXECUTOR_IN_DIR)/PrintRuleNameListRegx

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

Arithmetic_Syntax:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Syntax

Arithmetic_Syntax__Test:\
  $(ANTLR_OUT_Arithmetic_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/Arithmetic_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_Arithmetic_FPL)" ]; then \
	  echo "variable ANTLR_OUT_Arithmetic_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/Arithmetic_Syntax__Test

#-----------------------------------------------
#  GQL_20240412

ANTLR_OUT_GQL_20240412_FPL := $(shell ANTLR_OUT_FL GQL_20240412 -path $(ANTLR_OUT_DIR))
GQL_20240412_Syntax:\
  $(ANTLR_OUT_GQL_20240412_FPL)\
  $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_Syntax

GQL_20240412_Syntax__Test: \
  $(ANTLR_OUT_GQL_20240412_FPL) \
  $(JAVA_COMP_IN_PRIMARY_DIR)/GQL_20240412_Syntax_PrintVisitor.java
	@if [ -z "$(ANTLR_OUT_GQL_20240412_FPL)" ]; then \
	  echo "variable ANTLR_OUT_GQL_20240412_FPL empty."; \
	  exit 1; \
	fi
	$(REMAKE) $(EXECUTOR_IN_DIR)/GQL_20240412_Syntax__Test


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

$(ANTLR_OUT_DIR)/%Lexer.java \
$(ANTLR_OUT_DIR)/%Parser.java \
$(ANTLR_OUT_DIR)/%BaseListener.java \
$(ANTLR_OUT_DIR)/%Listener.java \
$(ANTLR_OUT_DIR)/%BaseVisitor.java \
$(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_PRIMARY_DIR)/%.g4
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
