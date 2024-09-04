$(info top_MAKECMDGOALS: $(MAKECMDGOALS))

.PHONY: all version clean setup tools project

# The 'all' target now depends on 'tools' and 'project'
all: setup tools project

version:
	$(info ANTLR_JAR is '$(notdir $(ANTLR_JAR))')
	@ $(JAVA_COMP) --version
	@ $(JAVA_ARCHIVE) --version
	@ make -v | head -n 1
	@ echo "makefile 0.4"

# `clean` is program independent of `make`
clean:
	@echo "Use the clean script from the $(EXECUTOR_IN_DIR) directory instead of \`make clean\`"
	@$(EXECUTOR_IN_DIR)/clean

setup:
	mkdir -p $(ANTLR_IN_PRIMARY_DIR) $(JAVA_COMP_IN_PRIMARY_DIR) $(JVM_IN_DIR)
	mkdir -p $(EXECUTOR_IN_DIR) test deprecated experiment documentation temporary

# Ensure tools like ANTLR_OUT_FL are built before building the project programs
tools: setup
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-tool.mk -$(MAKEFLAGS)

project: tools
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project.mk -$(MAKEFLAGS)

# all other targets are sent to makefile-project
%: tools
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project.mk -$(MAKEFLAGS) $@
