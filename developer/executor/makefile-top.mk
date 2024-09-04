$(info makefile: $(MAKEFILE_LIST))
$(info project_MAKECMDGOALS: $(MAKECMDGOALS))

# turn off implicit rules
.SUFFIXES:
MAKEFLAGS += -r

# `make` always tries to make its makefiles as targets. This prevents that.
.SECONDARY: $(MAKEFILE_LIST)

#================================================================================
# Custom make targets
#
.PHONY: top version clean setup tool- project-

# The 'all' target now depends on 'tool' and 'project'
top: setup tool- project-

# for distinguishing between make syntax errors and build errors
nothing:
	@:

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

# Ensure tools are built before building the project programs
tool-%: setup
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-tool.mk -$(MAKEFLAGS) $*

project-%: tool
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project.mk -$(MAKEFLAGS) $*

# delegate other targets to the project
%: project-%
	@:

