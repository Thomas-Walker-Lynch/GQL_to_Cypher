# Top level makefile assures we do setup, tools, and project build in correct order.

.PHONY: all setup tools project

# The 'all' target now depends on 'tools' and 'project'
all: setup tools project

.PHONY: version
version:
	$(info ANTLR_JAR is '$(notdir $(ANTLR_JAR))')
	@ $(JAVA_COMP) --version
	@ $(JAVA_ARCHIVE) --version
	@ make -v | head -n 1
	@ echo "makefile 0.4"

setup:
	mkdir -p $(ANTLR_IN_PRIMARY_DIR) $(JAVA_COMP_IN_PRIMARY_DIR) $(JVM_IN_DIR)
	mkdir -p $(EXECUTOR_IN_DIR) test deprecated experiment documentation temporary 

# Ensure tools like ANTLR_OUT_FL are built before building the project programs
tools: setup
	$(MAKE) -f $(EXECUTOR_IN_DIR)/makefile-tool -$(MAKEFLAGS)

# Run the project makefile and pass any targets or arguments to it
PROJECT_GOALS := $(filter-out setup version,$(MAKECMDGOALS))
project: setup tools
	$(MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project -$(MAKEFLAGS) $(PROJECT_GOALS)
