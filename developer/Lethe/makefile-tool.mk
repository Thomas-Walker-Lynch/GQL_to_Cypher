#================================================================================
# Build the tools that are needed for building the project.
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
.PHONY: all ANTLR_OUT_FL

all: ANTLR_OUT_FL

ANTLR_OUT_FL: $(EXECUTOR_IN_DIR)/ANTLR_OUT_FL

#================================================================================
# generic targets, aka recipes
#

# Without this, `make` sees .jar files as intermediate and deletes them.
.PRECIOUS: $(JAVA_COMP_OUT_DIR)/%.jar

# make .class file from .java file
$(JAVA_COMP_OUT_DIR)/%.class: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
	@echo "Compiling $<..."
	$(JAVA_COMP) -d $(JAVA_COMP_OUT_DIR) -sourcepath $(JAVA_COMP_IN_DL) $<
	@echo "Created $@"

# make .jar from .class file
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
