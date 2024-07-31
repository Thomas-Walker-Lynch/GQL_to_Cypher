

# Embedded and trailing spaces are included in the value, there are
# 4 of each used here. Leading spaces are not included.  If there is a comment
# starting with a hash, the trailing spaces leading up to are included.
# Use `make variable` to print the value assigned to the variables, including
# ISLAND. 
ISLAND =    land    island    

# JAVA_HOME, CLASSPATH, and ANTLR_JAR variables come from `env_dev`
JAVA_COMP   = $(JAVA_HOME)/bin/javac
JAVA_INTERP = $(JAVA_HOME)/bin/java
JAR         = $(JAVA_HOME)/bin/jar

# FL = File List
ANTLR_IN_DIR  = ANTLR
ANTLR_OUT_DIR = javac/antlr
ANTLR_IN_FL  = $(wildcard $(ANTLR_IN_DIR)/*.g4)
ANTLR_OUT_FL = $(patsubst $(ANTLR_IN_DIR)/%.g4,$(ANTLR_OUT_DIR)/%.java,$(ANTLR_IN_FL))

JAVA_IN_DIR = javac
JVM_IN_DIR  = jvm

JAVA_IN_FL0 = $(wildcard $(JAVA_IN_DIR)/*.java)
JAVA_IN_FL1 = $(ANTLR_OUT_FL)
JAVA_IN_FL = $(JAVA_IN_FL0) $(JAVA_IN_FL1)

JAVA_OUT_FL0 = $(patsubst $(JAVA_IN_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVA_IN_FL0))
JAVA_OUT_FL1 = $(patsubst $(ANTLR_OUT_DIR)/%.java,$(JVM_IN_DIR)/%.class,$(JAVA_IN_FL1))
JAVA_OUT_FL  = $(JAVA_OUT_FL0) $(JAVA_OUT_FL1)


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
	$(info ANTLR_JAR is '$(ANTLR_JAR)')
	$(info ANTLR_IN_DIR is '$(ANTLR_IN_DIR)')
	$(info ANTLR_OUT_DIR is '$(ANTLR_OUT_DIR)')
	$(info ANTLR_IN_FL is '$(ANTLR_IN_FL)')
	$(info ANTLR_OUT_FL is '$(ANTLR_OUT_FL)')
	$(info JAVA_COMP is '$(JAVA_COMP)')
	$(info JAVA_IN_DIR is '$(JAVA_IN_DIR)')
	$(info JVM_IN_DIR is '$(JVM_IN_DIR)')

	$(info JAVA_IN_FL0 is '$(JAVA_IN_FL0)')
	$(info JAVA_IN_FL1 is '$(JAVA_IN_FL1)')
	$(info JAVA_IN_FL is '$(JAVA_IN_FL)')

	$(info JAVA_OUT_FL0 is '$(JAVA_OUT_FL0)')
	$(info JAVA_OUT_FL1 is '$(JAVA_OUT_FL1)')
	$(info JAVA_OUT_FL is '$(JAVA_OUT_FL)')
	$(info JAR is '$(JAR)')

.PHONY: version
version:
	@ $(JAVA_COMP) --version
	@ $(JAR) --version
	$(info ANTLR_JAR is '$(ANTLR_JAR)')
	@ make -v | head -n 1

.PHONY: setup
setup:
	mkdir -p $(ANTLR_IN_DIR) $(ANTLR_OUT_DIR) $(JAVA_IN_DIR) $(JVM_IN_DIR)
	mkdir -p deprecated  experiment  lector temporary test

.PHONY: clean
clean:
	rm -rf $(JVM_IN_DIR)/*
	rm -rf $(ANTLR_OUT_DIR)/*.java

# recipes
$(ANTLR_OUT_DIR)/%.java: $(ANTLR_IN_DIR)/%.g4
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -o $(ANTLR_OUT_DIR) $<

$(JAVA_OUT_FL0): $(JVM_IN_DIR)/%.class: $(JAVA_IN_DIR)/%.java
	$(JAVA_COMP) -d $(JVM_IN_DIR) -cp $(ANTLR_JAR) $<

$(JAVA_OUT_FL1): $(JVM_IN_DIR)/%.class: $(ANTLR_OUT_DIR)/%.java
	$(JAVA_COMP) -d $(JVM_IN_DIR) -cp $(ANTLR_JAR) $<

$(JVM_IN_DIR)/$(GQL_SYNTAX_TREE).jar: $(JAVA_OUT_FL)
	$(JAR) cvf $@ -C $(JVM_IN_DIR) .

