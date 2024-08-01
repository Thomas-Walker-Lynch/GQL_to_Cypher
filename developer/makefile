# GQL_to_Cypher makefile

# Use `make variable` to print the value assigned to the variables in this header.

# Embedded and trailing spaces are included in the value, there are 4 of each
# present in the value for ISLAND. Leading spaces are not included.  If there is
# a comment starting with a hash, the trailing spaces leading up to it are
# included.
ISLAND =    land    island    

# JAVA_HOME, CLASSPATH, and ANTLR_JAR variables come from `env_dev`

JAVA_COMP   = $(JAVA_HOME)/bin/javac
JAVA_INTERP = $(JAVA_HOME)/bin/java
JAR         = $(JAVA_HOME)/bin/jar

# FL = File List
# ANTLR automatically creates the directory ANTLR under $(ANTLR_OUT_DIR_DIR)
ANTLR_IN_DIR  = ANTLR
ANTLR_OUT_DIR_DIR = javac
ANTLR_OUT_DIR = javac/ANTLR
ANTLR_IN_FL  = $(wildcard $(ANTLR_IN_DIR)/*.g4)
ANTLR_OUT_FL = $(patsubst $(ANTLR_IN_DIR)/%.g4,$(ANTLR_OUT_DIR)/%.java,$(ANTLR_IN_FL))
CLASSPATH_LOCAL := $(CLASSPATH):$(ANTLR_OUT_DIR)


JAVA_IN_DIR = javac
JVM_IN_DIR  = jvm

JAVA_IN_FL0 = $(wildcard $(JAVA_IN_DIR)/*.java)
JAVA_IN_FL1 = $(ANTLR_OUT_FL)
JAVA_IN_FL = $(JAVA_IN_FL0) $(JAVA_IN_FL1)

JAVA_OUT_FL0 = $(patsubst $(JAVA_IN_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVA_IN_FL0))
JAVA_OUT_FL1 = $(patsubst $(ANTLR_OUT_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVA_IN_FL1))
JAVA_OUT_FL  = $(JAVA_OUT_FL0) $(JAVA_OUT_FL1)


# programs we are creating
SYNTAX_TREE_20240412 = SyntaxTree20240412
#...
OUT_FL = $(JVM_IN_DIR)/$(SYNTAX_TREE_20240412).jar
.PHONY: all
all: grammar program

.PHONY: program
program: setup $(OUT_FL)

.PHONY: grammar
grammar: setup $(ANTLR_OUT_FL)

.PHONY: variable
variable:
	$(info ISLAND is '$(ISLAND)')

	$(info JAVA_HOME is '$(JAVA_HOME)')
	$(info CLASSPATH is '$(CLASSPATH)')
	$(info ANTLR_JAR is '$(ANTLR_JAR)')

	$(info JAVA_COMP is '$(JAVA_COMP)')
	$(info JAVA_INTERP is '$(JAVA_INTERP)')
	$(info JAR is '$(JAR)')

	$(info ANTLR_IN_DIR is '$(ANTLR_IN_DIR)')
	$(info ANTLR_OUT_DIR is '$(ANTLR_OUT_DIR)')
	$(info ANTLR_OUT_DIR_DIR is '$(ANTLR_OUT_DIR_DIR)')
	$(info ANTLR_IN_FL is '$(ANTLR_IN_FL)')
	$(info ANTLR_OUT_FL is '$(ANTLR_OUT_FL)')
	$(info CLASSPATH_LOCAL is '$(CLASSPATH_LOCAL)')

	$(info JAVA_IN_DIR is '$(JAVA_IN_DIR)')
	$(info JVM_IN_DIR is '$(JVM_IN_DIR)')

	$(info JAVA_IN_FL0 is '$(JAVA_IN_FL0)')
	$(info JAVA_IN_FL1 is '$(JAVA_IN_FL1)')
	$(info JAVA_IN_FL is '$(JAVA_IN_FL)')

	$(info JAVA_OUT_FL0 is '$(JAVA_OUT_FL0)')
	$(info JAVA_OUT_FL1 is '$(JAVA_OUT_FL1)')
	$(info JAVA_OUT_FL is '$(JAVA_OUT_FL)')

.PHONY: version
version:
	@ $(JAVA_COMP) --version
	@ $(JAR) --version
	$(info ANTLR_JAR is '$(ANTLR_JAR)')
	@ make -v | head -n 1

.PHONY: setup
setup:
	# ANTLR automatically creates $(ANTLR_OUT_DIR_DIR)
	# if it already exists, the auto created one  nests below the existing one
	mkdir -p $(ANTLR_IN_DIR) $(JAVA_IN_DIR) $(JVM_IN_DIR)
	mkdir -p deprecated  experiment  lector temporary test


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


# recipes

# ANTLR automatically creates a directory called ANTLR under the -o directory,
# and puts the resulting .java files in it. It is a little unusual, as a person
# would expect to pass in a directory directly, rather passing in the directory to put
# the automatically created directory in ..
$(ANTLR_OUT_DIR)/%.java: $(ANTLR_IN_DIR)/%.g4
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -o $(ANTLR_OUT_DIR_DIR) $<

$(JVM_IN_DIR)/%.class: $(JAVA_IN_DIR)/%.java $(ANTLR_OUT_DIR)/%.java
	$(JAVA_COMP) -d $(JVM_IN_DIR) -cp $(CLASSPATH_LOCAL) $<

$(JVM_IN_DIR)/$(SYNTAX_TREE_20240412).jar: $(JAVA_OUT_FL)
	$(JAR) cvf $@ -C $(JVM_IN_DIR) .

