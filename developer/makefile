# GQL_to_Cypher makefile

#--------------------------------------------------------------------------------
# Setup the environment
#
# Use `make variable` to print the value assigned to the variables in this section

# An example. Embedded and trailing spaces are included in the value, there are
# 4 of each present in the value for ISLAND. Leading spaces are not included.
# If there is a comment starting with a hash, the trailing spaces leading up to
# it are included.
ISLAND :=    land    island    

# Note these abreviations:
# FL = File List, out file lists are those we want make to create
# DL = Directory List

# programs used by this makefile
JAVA_COMP    := $(JAVA_HOME)/bin/javac
JAVA_INTERP  := $(JAVA_HOME)/bin/java
JAVA_ARCHIVE := $(JAVA_HOME)/bin/jar

# ANTLR directories
ANTLR_IN_DIR  := ANTLR
ANTLR_OUT_DIR := javac/ANTLR
ANTLR_OUT_DIR_PARENT := javac

# ANTLR files
ANTLR_IN_FL  := $(wildcard $(ANTLR_IN_DIR)/*.g4)
ANTLR_OUT_FL := $(patsubst $(ANTLR_IN_DIR)/%.g4,$(ANTLR_OUT_DIR)/%.java,$(ANTLR_IN_FL))

# JAVA directories
JAVAC_IN_PRIMARY_DIR := javac
JAVAC_IN_ANTLR_DIR   := $(ANTLR_OUT_DIR)
JAVAC_IN_DL          := $(JAVAC_IN_PRIMARY_DIR) $(JAVAC_IN_ANTLR_DIR)
JVM_IN_DIR           := jvm

# JAVA files
JAVAC_IN_PRIMARY_FL := $(wildcard $(JAVAC_IN_PRIMARY_DIR)/*.java)
JAVAC_IN_ANTLR_FL   := $(ANTLR_OUT_FL)
JAVAC_IN_FL         := $(JAVAC_IN_PRIMARY_FL) $(JAVAC_IN_ANTLR_FL)

JAVAC_OUT_PRIMARY_FL := $(patsubst $(JAVAC_IN_PRIMARY_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVAC_IN_PRIMARY_FL))
JAVAC_OUT_ANTLR_FL   := $(patsubst $(ANTLR_OUT_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVAC_IN_ANTLR_FL))
JAVAC_OUT_FL         := $(JAVAC_OUT_PRIMARY_FL) $(JAVAC_OUT_ANTLR_FL)

# programs we are creating
SYNTAX_TREE_20240412 := SyntaxTree20240412
OUT_FL := $(JVM_IN_DIR)/$(SYNTAX_TREE_20240412).jar


# java command CLASS directory search and source directory search
CLASSPATH := $(CLASSPATH):$(JVM_IN_DIR)
export CLASSPATH
JAVA_IN_DL := $(JAVAC_IN_PRIMARY_DIR):$(ANTLR_OUT_DIR)



#--------------------------------------------------------------------------------
# Top level make targets
#

# compile all the programs
# this first target is the default for make
.PHONY: program
program: setup $(OUT_FL)

# compile all the grammar files whether they are needed or not
.PHONY: grammar
grammar: setup $(ANTLR_OUT_FL)

# compile all the .java files, whether they are needed or not
.PHONY: java
program: setup $(JAVAC_OUT_FL)

# print out all variables with quotes so that spaces can be detected
.PHONY: variable
variable:
	$(info ISLAND is '$(ISLAND)')

	$(info JAVA_HOME is '$(JAVA_HOME)')
	$(info ANTLR_JAR is '$(ANTLR_JAR)')

	$(info JAVA_COMP is '$(JAVA_COMP)')
	$(info JAVA_INTERP is '$(JAVA_INTERP)')
	$(info JAVA_ARCHIVE is '$(JAVA_ARCHIVE)')

	$(info ANTLR_IN_DIR is '$(ANTLR_IN_DIR)')
	$(info ANTLR_OUT_DIR is '$(ANTLR_OUT_DIR)')
	$(info ANTLR_OUT_DIR_PARENT is '$(ANTLR_OUT_DIR_PARENT)')
	$(info ANTLR_IN_FL is '$(ANTLR_IN_FL)')
	$(info ANTLR_OUT_FL is '$(ANTLR_OUT_FL)')

	$(info JAVAC_IN_PRIMARY_DIR is '$(JAVAC_IN_PRIMARY_DIR)')
	$(info JAVAC_IN_ANTLR_DIR is '$(JAVAC_IN_ANTLR_DIR)')
	$(info JVM_IN_DIR is '$(JVM_IN_DIR)')

	$(info JAVAC_IN_PRIMARY_FL is '$(JAVAC_IN_PRIMARY_FL)')
	$(info JAVAC_IN_ANTLR_FL is '$(JAVAC_IN_ANTLR_FL)')
	$(info JAVAC_IN_FL is '$(JAVAC_IN_FL)')

	$(info JAVAC_OUT_PRIMARY_FL is '$(JAVAC_OUT_PRIMARY_FL)')
	$(info JAVAC_OUT_ANTLR_FL is '$(JAVAC_OUT_ANTLR_FL)')
	$(info JAVAC_OUT_FL is '$(JAVAC_OUT_FL)')

	$(info CLASSPATH is '$(CLASSPATH)')
	$(info JAVA_IN_DL is '$(JAVA_IN_DL)')
	@:

.PHONY: version
version:
	$(info ANTLR_JAR is '$(notdir $(ANTLR_JAR))')
	@ $(JAVA_COMP) --version
	@ $(JAVA_ARCHIVE) --version
	@ make -v | head -n 1
	@ echo "makefile 0.1"

.PHONY: setup
setup:
	# ANTLR automatically creates $(ANTLR_OUT_DIR)
	mkdir -p $(ANTLR_IN_DIR) $(JAVAC_IN_PRIMARY_DIR) $(JVM_IN_DIR)
	mkdir -p test deprecated  experiment  documentation temporary 

.PHONY: clean
clean:
	@if [ -n "$(JVM_IN_DIR)" ]; then \
	  echo "Cleaning $(JVM_IN_DIR)"; \
	  rm -rf $(JVM_IN_DIR)/*; \
	else \
	  echo "Warning: JVM_IN_DIR is not set"; \
	fi
	@if [ -n "$(ANTLR_OUT_DIR)" ]; then \
	  echo "Cleaning $(ANTLR_OUT_DIR)"; \
	  rm -rf $(ANTLR_OUT_DIR); \
	else \
	  echo "Warning: ANTLR_OUT_DIR is not set"; \
	fi
	@if [ -d "temporary" ]; then \
	  echo "Cleaning temporary directory"; \
	  rm -rf temporary/*; \
	else \
	  echo "Warning: temporary directory does not exist"; \
	fi

#--------------------------------------------------------------------------------
# recipes

ANTLR_FILES := GQL_20240412BaseListener.java GQL_20240412BaseVisitor.java GQL_20240412Lexer.java GQL_20240412Listener.java GQL_20240412Parser.java GQL_20240412Visitor.java


# Generate ANTLR .java files
$(ANTLR_OUT_FL): $(ANTLR_OUT_DIR)/%.java: $(ANTLR_IN_DIR)/%.g4
	@echo "making grammar from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<


$(JAVAC_OUT_ANTLR_FL): $(JVM_IN_DIR)/%.class: $(ANTLR_OUT_DIR)/%.java
	@echo "making class from ANTLR generated" $<
	$(JAVA_COMP) -d $(JVM_IN_DIR) -sourcepath $(JAVA_IN_DL) $(addprefix $(ANTLR_OUT_DIR)/, $(ANTLR_FILES))

# # Compile ANTLR-generated Java files
# $(JAVAC_OUT_ANTLR_FL): $(JVM_IN_DIR)/%.class: $(ANTLR_OUT_DIR)/%.java
# 	@echo "making class from ANTLR generated" $<
# 	$(JAVA_COMP) -d $(JVM_IN_DIR) -sourcepath $(JAVA_IN_DL) $<

# Compile primary Java files
$(JAVAC_OUT_PRIMARY_FL): $(JVM_IN_DIR)/%.class: $(JAVAC_IN_PRIMARY_DIR)/%.java $(JAVAC_OUT_ANTLR_FL)
	@echo "making class from primary" $<
	$(JAVA_COMP) -d $(JVM_IN_DIR) -sourcepath $(JAVA_IN_DL) $<

# Create JAR file
$(JVM_IN_DIR)/$(SYNTAX_TREE_20240412).jar: $(JAVAC_OUT_FL)
	@echo "making program" $@ "from files found in" $(JVM_IN_DIR)
	$(JAVA_ARCHIVE) cvf $@ -C $(JVM_IN_DIR) .
