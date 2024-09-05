#================================================================================
# top level makefile calls makefile-tool and makefile-project
#

# turn off implicit rules, because they can do unexpected things.
.SUFFIXES:
MAKEFLAGS += -r

# Turns off the "feature" where `make` tries to make its makefiles as file targets. There
# is no command line switch to turn this off.
.PHONY: $(MAKEFILE_LIST)

# 'make' has a "feature" where it deletes what it determines to be intermediate
# files.  There is no command line switch to turn this behavior off. Combine
# this feature with implicit rules to have loads of fun. At least this prevents
# make from deleting its makefiles if it happens to decide one is an
# intermediate file.
.PRECIOUS: $(MAKEFILE_LIST)

#$(info makefile: $(MAKEFILE_LIST))
#$(info project_MAKECMDGOALS: $(MAKECMDGOALS))

# for recursive make without leaving this makefile
REMAKE = $(MAKE) -$(MAKEFLAGS) -f $(MAKEFILE_LIST)

#================================================================================
# Custom make targets
#
.PHONY: all nothing version clean setup

all: project-all

# useful for distinguishing between make syntax errors and build errors
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
	mkdir -p $(ANTLR_IN_PRIMARY_DIR) $(JAVA_COMP_IN_PRIMARY_DIR) $(JVM_IN_DIR) $(EXECUTOR_IN_DIR) test deprecated experiment ologist temporary

# Ensure tools are built before building the project programs
tool-%: setup
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-tool.mk -$(MAKEFLAGS) $*

project-%: tool-all
	$(BIN_MAKE) -f $(EXECUTOR_IN_DIR)/makefile-project.mk -$(MAKEFLAGS) $*

# delegate other targets to the project
%: project-%
	@:

