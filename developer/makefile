# Used for C or C++ files along with the makefile found in the 'resource' project

# how to run make
SHELL=/bin/bash
RESOURCE := /var/user_data/Thomas-developer/resource/development

# picks up globally defined variables, that can be used/modified while defining local variables
include $(RESOURCE)/library/makefile-environment

ENVDIR=../env
DOCDIR=lector
EXECDIR=machine
LIBDIR=linker
SRCDIR=compiler
TESTDIR=test
TMPDIR=temporary
TRYDIR=experiment

C=gcc

CFLAGS= -include "compiler/environment.h" -std=gnu18 -Werror -O0 -ggdb -DDEBUG -DDEBUGDB -I$(SRCDIR) -I$(RESOURCE)/include -I$(ENVDIR)/include -I/usr/include/libevdev-1.0
LINKFLAGS=-L$(LIBDIR) -L$(RESCOURCE)/lib/ -L$(ENVDIR)/lib/ -L/usr/lib -L/usr/lib64 -l$(PROJECT) -levdev


#--------------------------------------------------------------------------------
# import the rules
#

# the dash prefix means to ignore include errors, the DEPFILE might not exist yet
-include $(DEPFILE)
include $(RESOURCE)/library/makefile
