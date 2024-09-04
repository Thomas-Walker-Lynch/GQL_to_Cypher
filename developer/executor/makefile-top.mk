# In GNU make, pattern matches can not be empty strings.
# `> make project`, or `make project-project` makes the entire project
# `> make tool-tool` makes all the tools (while not making the project).

# turn off implicit rules
.SUFFIXES:
MAKEFLAGS += -r

# `make` always tries to make its make files as target files. This prevents that.
.PHONY: $(MAKEFILE_LIST)
.PRECIOUS: $(MAKEFILE_LIST)

$(info makefile: $(MAKEFILE_LIST))
$(info project_MAKECMDGOALS: $(MAKECMDGOALS))


#================================================================================
# Custom make targets
#
.PHONY: top version clean setup

# The 'all' target now depends on 'tool' and 'project'
top: setup tool-tool project-project

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
	@echo "Use the command `clean <option>` instead of make.`"

setup:
	mkdir -p $(ANTLR_IN_PRIMARY_DIR) $(JAVA_COMP_IN_PRIMARY_DIR) $(JVM_IN_DIR)
	mkdir -p $(EXECUTOR_IN_DIR) test deprecated experiment ologist temporary

# Ensure tools are built before building the project programs
tool-%: setup
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-tool.mk -$(MAKEFLAGS) $*

project-%: tool-tool
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project.mk -$(MAKEFLAGS) $*

# delegate other targets to the project
%: project-%
	@:

