# GQL_to_Cypher makefile

#================================================================================
# Setup the environment
#
# Use `make variable` to print the value assigned to each variable in this section

#----------------------------------------
# some notes about setting variables. Save yourself some grief by reading this.
#

# Note these suffixes:
# _FL  = File List
# _FPL = File Path List 
# _DL  = Directory List

# _PRIMARY means these are primary inputs, this makefile does not build them
# _IN  program inputs
# _OUT expected program outputs

# The following is an example of setting a variable. Use `make variable`
# to prints its value, and note the embedded and trailing spaces.
ISLAND :=    land    island    

#----------------------------------------
# programs used by this makefile
#
JAVA_COMP    := $(JAVA_HOME)/bin/javac
JAVA_INTERP  := $(JAVA_HOME)/bin/java
JAVA_ARCHIVE := $(JAVA_HOME)/bin/jar

#----------------------------------------
# programs being built by this makefile:
#
PROGRAM_PrintRuleNameList   := executor/PrintRuleNameList
PROGRAM_SyntaxTree_Test     := executor/SyntaxTree_Test
PROGRAM_SyntaxTree_20240412 := executor/SyntaxTree_20240412

PROGRAM_FPL := $(PROGRAM_PrintRuleNameList) $(PROGRAM_SyntaxTree_Test) $(PROGRAM_SyntaxTree_20240412)

#----------------------------------------
# ANTLR environment
#   Add a `<grammar>.g4` file into the ANTLR_IN_DIR

# ANTLR directories
ANTLR_PRIMARY_DIR    := ANTLR
ANTLR_IN_DIR         := $(ANTLR_PRIMARY_DIR)
ANTLR_OUT_DIR        := javac/ANTLR
ANTLR_OUT_DIR_PARENT := javac


# ANTLR input files
ANTLR_IN_FPL := $(wildcard $(ANTLR_IN_DIR)/*.g4)
ANTLR_GRAMMAR_LIST := $(basename $(notdir $(ANTLR_IN_FPL)))
ifeq ($(strip $(ANTLR_IN_FPL)),)
  $(info No ANTLR input grammar files found)
endif

# ANTLR will produce these output files.

# This function accepts a grammar name, or a grammar name with an extension; 
# and sets a variable of the form ANTLR_OUT_<grammar>_FPL to a list of
# files that ANTLR would produce for <grammar>.
define set_ANTLR_out_fpl_var
  ANTLR_OUT_$(basename $1)_FPL := \
    $(ANTLR_OUT_DIR)/$(basename $1)Lexer.java \
    $(ANTLR_OUT_DIR)/$(basename $1)Parser.java \
    $(ANTLR_OUT_DIR)/$(basename $1)BaseVisitor.java \
    $(ANTLR_OUT_DIR)/$(basename $1)Visitor.java
endef

# Generate ANTLR_OUT_<grammar>_FPL for each grammar
$(foreach file,$(ANTLR_GRAMMAR_LIST),$(eval $(call set_ANTLR_out_fpl_var,$(file))))

# Combine all individual file lists into ANTLR_OUT_FPL
ANTLR_OUT_FPL := $(foreach file,$(ANTLR_GRAMMAR_LIST),$(value ANTLR_OUT_$(file)_FPL))

#----------------------------------------
# Java environment

# JAVA directories
JAVA_COMP_IN_PRIMARY_DIR := javac
JAVA_COMP_IN_ANTLR_DIR   := $(ANTLR_OUT_DIR)
JAVA_COMP_IN_DL          := $(JAVA_COMP_IN_PRIMARY_DIR):$(JAVA_COMP_IN_ANTLR_DIR)
JAVA_COMP_OUT_DIR        := jvm

# JAVA input files
JAVA_COMP_IN_PRIMARY_FPL := $(wildcard $(JAVA_COMP_IN_PRIMARY_DIR)/*.java)
JAVA_COMP_IN_ANTLR_FPL   := $(ANTLR_OUT_FPL)
JAVA_COMP_IN_FPL         := $(JAVA_COMP_IN_PRIMARY_FPL) $(JAVA_COMP_IN_ANTLR_FPL)

# JAVA will produce these output files
JAVA_COMP_OUT_PRIMARY_FPL := $(patsubst $(JAVA_COMP_IN_PRIMARY_DIR)/%.java,$(JAVA_COMP_OUT_DIR)/%.class,$(JAVA_COMP_IN_PRIMARY_FPL))
JAVA_COMP_OUT_ANTLR_FPL   := $(patsubst $(JAVA_COMP_IN_ANTLR_DIR)/%.java,$(JAVA_COMP_OUT_DIR)/%.class,$(JAVA_COMP_IN_ANTLR_FPL))
JAVA_COMP_OUT_FPL         := $(JAVA_COMP_OUT_PRIMARY_FPL) $(JAVA_COMP_OUT_ANTLR_FPL)

#----------------------------------------
# JVM environment

JVM_IN_DIR := $(JAVA_COMP_OUT_DIR)
CLASSPATH := $(CLASSPATH):$(JVM_IN_DIR)
export CLASSPATH


#================================================================================
# Make targets
#

# The general make everything targets:
all: setup $(PROGRAM_FPL)
grammar: setup $(ANTLR_OUT_FPL)

# specific programs or program versions:
PrintRuleNameList: $(PrintRuleNameList)
SyntaxTree_Test: $(ANTLR_OUT_SyntaxTree_Test_FPL) $(SyntaxTree_Test)
SyntaxTree_20240412: $(ANTLR_OUT_SyntaxTree_20240412_FPL) $(SyntaxTree_20240412)

# Specific grammar targets. Run them like this:
# > make <grammar_name>
# e.g. > make GQL_test
$(foreach grammar,$(ANTLR_GRAMMAR_LIST),$(eval $(grammar): $(value ANTLR_OUT_$(grammar)_FPL)))

# Compile all the .java files.
java: setup $(JAVA_COMP_OUT_FPL)

# prints out each variable within quotes so that spaces can be seen
.PHONY: variable
variable:
	$(info ISLAND is '$(ISLAND)')

	$(info PROGRAM_PrintRuleNameList is '$(PROGRAM_PrintRuleNameList)')
	$(info PROGRAM_SyntaxTree_Test is '$(PROGRAM_SyntaxTree_Test)')
	$(info PROGRAM_SyntaxTree_20240412 is '$(PROGRAM_SyntaxTree_20240412)')
	$(info PROGRAM_FPL is '$(PROGRAM_FPL)')

	$(info JAVA_COMP is '$(JAVA_COMP)')
	$(info JAVA_INTERP is '$(JAVA_INTERP)')
	$(info JAVA_ARCHIVE is '$(JAVA_ARCHIVE)')

	$(info ANTLR_PRIMARY_DIR is '$(ANTLR_PRIMARY_DIR)')
	$(info ANTLR_IN_DIR is '$(ANTLR_IN_DIR)')
	$(info ANTLR_OUT_DIR is '$(ANTLR_OUT_DIR)')
	$(info ANTLR_OUT_DIR_PARENT is '$(ANTLR_OUT_DIR_PARENT)')
	$(info ANTLR_IN_FPL is '$(ANTLR_IN_FPL)')
	$(info ANTLR_GRAMMAR_LIST is '$(ANTLR_GRAMMAR_LIST)')
	$(foreach file,$(ANTLR_GRAMMAR_LIST),$(info ANTLR_OUT_$(file)_FPL is '$(value ANTLR_OUT_$(file)_FPL)'))
	$(info ANTLR_OUT_FPL is '$(ANTLR_OUT_FPL)')

	$(info JAVA_COMP_IN_PRIMARY_DIR is '$(JAVA_COMP_IN_PRIMARY_DIR)')
	$(info JAVA_COMP_IN_ANTLR_DIR is '$(JAVA_COMP_IN_ANTLR_DIR)')
	$(info JAVA_COMP_IN_DL is '$(JAVA_COMP_IN_DL)')
	$(info JAVA_COMP_OUT_DIR is '$(JAVA_COMP_OUT_DIR)')

	$(info JAVA_COMP_IN_PRIMARY_FPL is '$(JAVA_COMP_IN_PRIMARY_FPL)')
	$(info JAVA_COMP_IN_ANTLR_FPL is '$(JAVA_COMP_IN_ANTLR_FPL)')
	$(info JAVA_COMP_IN_FPL is '$(JAVA_COMP_IN_FPL)')

	$(info JAVA_COMP_OUT_PRIMARY_FPL is '$(JAVA_COMP_OUT_PRIMARY_FPL)')
	$(info JAVA_COMP_OUT_ANTLR_FPL is '$(JAVA_COMP_OUT_ANTLR_FPL)')
	$(info JAVA_COMP_OUT_FPL is '$(JAVA_COMP_OUT_FPL)')

	$(info JVM_IN_DIR is '$(JVM_IN_DIR)')
	$(info CLASSPATH is '$(CLASSPATH)')
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
	mkdir -p $(ANTLR_IN_DIR) $(JAVA_COMP_IN_PRIMARY_DIR) $(JVM_IN_DIR)
	mkdir -p executor test deprecated experiment documentation temporary 


# Define directories
TEMP_DIR := temp
GQL_DIR := gql

# 1. clean:temporary  - removes files from ./temporary
# 2. General clean targets:
#      clean:all  - removes all things make built, and thus can be replaced by running make again.
#      clean:all-   (minus after the all)  same as clean:all except for the program files (and their .jar if any)
#      clean:program -  all program files, i.e. ./exector/<program>   and ./jvm/<program.jar>  for all programs.
#      clean:class - class files
#      clean:grammar - all generated grammar files
     
# 2. 
#     clean:program:<name>
#     similear to clean:program, but only for the named program

#     clean:program+:<name>
#     bascially clean:all but only for the named program

#     clean:program-:<mame>
#     baiscally clean:all- but only for the named program

# 3. clean:grammar:<name>
#     siimilar to clean:grammar, but only for the named grammar	

# Function to handle individual cleaning
# Accepts a single option and removes the appropriate files
define do_clean
  @echo "Cleaning files for option: $1"
  if [ "$1" = "" ]; then \
    @echo "Usage: make clean:< all[-] | |program[+/-][:<name>] | grammar[:<name>] | class | temp[orary] >" \
  elif [ "$1" = "temporary" -o "$1" = "temp" ]; then \
    rm -rf $(TEMP_DIR); \
  elif [ "$1" = "all" ]; then \
    rm -rf $(TEMP_DIR) $(ANTLR_OUT_DIR) $(JAVA_COMP_OUT_DIR) executor/*; \
  elif [ "$1" = "all-" ]; then \
    rm -rf $(TEMP_DIR) $(ANTLR_OUT_DIR) $(JAVA_COMP_OUT_DIR)/*.class; \
  elif [ "$1" = "program" ]; then \
    rm -rf $(JAVA_COMP_OUT_DIR)/*.jar executor/*; \
  elif [ "$1" = "class" ]; then \
    rm -rf $(JAVA_COMP_OUT_DIR)/*.class; \
  elif [ "$1" = "grammar" ]; then \
    rm -rf $(ANTLR_OUT_DIR); \
  elif [[ "$1" =~ ^program:(.+)$ ]]; then \
    rm -rf $(JAVA_COMP_OUT_DIR)/$$(basename $$(echo $$1 | cut -d: -f2)).jar executor/$$(basename $$(echo $$1 | cut -d: -f2)); \
  elif [[ "$1" =~ ^program\+:(.+)$ ]]; then \
    rm -rf $(JAVA_COMP_OUT_DIR)/$$(basename $$(echo $$1 | cut -d: -f2)).jar executor/$$(basename $$(echo $$1 | cut -d: -f2)) $(TEMP_DIR) $(ANTLR_OUT_DIR); \
  elif [[ "$1" =~ ^program-:(.+)$ ]]; then \
    rm -rf $(JAVA_COMP_OUT_DIR)/$$(basename $$(echo $$1 | cut -d: -f2)).jar executor/$$(basename $$(echo $$1 | cut -d: -f2)) $(TEMP_DIR) $(ANTLR_OUT_DIR)/*.class; \
  elif [[ "$1" =~ ^grammar:(.+)$ ]]; then \
    rm -rf $(ANTLR_OUT_DIR)/$$(basename $$(echo $$1 | cut -d: -f2))*; \
  else \
    echo "Unknown clean option: $1"; \
  fi
endef

# Clean specific program or option
# Calls the process_clean_options function with the pattern as an argument
clean:%:
	$(call do_clean,$*)

#useful for distinguishing initial make error messages and message generated by rules firing
nothing:
	@:


#================================================================================
# recipes


# ANTLR a run of any of these will make all the files
$(ANTLR_OUT_DIR)/%Lexer.java \
$(ANTLR_OUT_DIR)/%Parser.java \
$(ANTLR_OUT_DIR)/%BaseVisitor.java \
$(ANTLR_OUT_DIR)/%Visitor.java: $(ANTLR_IN_DIR)/%.g4
	@echo "making grammar from:" $<
	$(JAVA_INTERP) -jar $(ANTLR_JAR) -Dlanguage=Java -visitor -o $(ANTLR_OUT_DIR_PARENT) $<

# Generic recipe for building .jar files and placing scripts in the executor directory
$(JAVA_COMP_OUT_DIR)/%.jar: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
	@echo "Building $*..."
	$(JAVA_COMP) -d $(JAVA_COMP_OUT_DIR) -sourcepath $(JAVA_COMP_IN_DL) $<
	$(JAVA_ARCHIVE) cf $@ -C $(JVM_IN_DIR) $*.class

executor/%: $(JAVA_COMP_OUT_DIR)/%.jar
	@echo "Creating script for $*..."
	echo "#!/usr/bin/env bash\n$(JAVA_INTERP) -cp $@ $*" > executor/$*
	chmod +x executor/$*


# LocalWords:  makefile
