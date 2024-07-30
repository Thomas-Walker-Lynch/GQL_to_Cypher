
# FL = File List

ISLAND        =    land    island    # value has embedded and trailing spaces

ANTLR_JAR     = ../tool/executor/antlr-4.9.2-complete.jar

ANTLR_IN_DIR  = ANTLR
ANTLR_OUT_DIR = javac/antlr
ANTLR_IN_FL   = $(wildcard $(ANTLR_IN_DIR)/*.g4)
ANTLR_OUT_FL  = $(patsubst %.g4,$(ANTLR_OUT_DIR)/%.java,$(ANTLR_IN_FL))

JAR         = $(JAVA_HOME)/bin/jar
JAVAC       = $(JAVA_HOME)/bin/javac
JAVA_IN_DIR = javac
JAVA_IN_FL  = $(wildcard $(JAVA_IN_DIR)/*.java) $(ANTLR_OUT_FL)
JVM_IN_DIR  = jvm


# programs we are creating
GQL_SYNTAX_TREE = GQL_syntax_tree
#...
OUT_FL = $(JVM_IN_DIR)/$(GQL_SYNTAX_TREE).jar


.PHONY: all
all: grammar program

.PHONY: program
program: setup $(OUT_FL)

.PHONY: grammar
grammar: setup $(ANTLR_OUT_FL)

.PHONY: variable
variable:
	$(info ISLAND is '$(ISLAND)')
	$(info JAVAC is '$(JAVAC)')
	$(info JAR is '$(JAR)')
	$(info ANTLR_JAR is '$(ANTLR_JAR)')
	$(info JAVA_IN_DIR is '$(JAVA_IN_DIR)')
	$(info JVM_IN_DIR is '$(JVM_IN_DIR)')
	$(info ANTLR_IN_DIR is '$(ANTLR_IN_DIR)')
	$(info ANTLR_OUT_DIR is '$(ANTLR_OUT_DIR)')
	$(info JAVA_IN_FL is '$(JAVA_IN_FL)')
	$(info ANTLR_IN_FL is '$(ANTLR_IN_FL)')
	$(info ANTLR_OUT_FL is '$(ANTLR_OUT_FL)')

.PHONY: version
version:
	@ $(JAVAC) --version
	@ $(JAR) --version
	$(info ANTLR_JAR is '$(ANTLR_JAR)')
	@ make -v | head -n 1

.PHONY: setup
setup:
	mkdir -p $(JAVA_IN_DIR)
	mkdir -p $(JVM_IN_DIR)
	mkdir -p $(ANTLR_OUT_DIR)

.PHONY: clean
clean:
	rm -rf $(JVM_IN_DIR)/*
	rm -rf $(ANTLR_OUT_DIR)/*.java

# Compile ANTLR grammars
$(ANTLR_OUT_DIR)/%.java: $(ANTLR_IN_DIR)/%.g4
	java -jar $(ANTLR_JAR) -Dlanguage=Java -o $(ANTLR_OUT_DIR) $<

# Compile Java sources
$(JVM_IN_DIR)/%.class: $(JAVA_IN_DIR)/gql/%.java $(ANTLR_OUT_FL)
	$(JAVAC) -d $(JVM_IN_DIR) -cp $(ANTLR_JAR) $<

# Create jar file
$(JVM_IN_DIR)/$(GQL_SYNTAX_TREE).jar: $(patsubst $(JAVA_IN_DIR)/gql/%.java,$(JVM_IN_DIR)/%.class,$(JAVA_IN_FL))
	$(JAR) cvf $@ -C $(JVM_IN_DIR) .
