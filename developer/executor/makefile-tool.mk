#================================================================================
# Custom make targets
#

all: ANTLR_OUT_FL

ANTLR_OUT_FL: $(EXECUTOR_IN_DIR)/ANTLR_OUT_FL



#================================================================================
# generic targets, aka recipes
#

# Rule to build .class files from .java files
$(JAVA_COMP_OUT_DIR)/%.class: $(JAVA_COMP_IN_PRIMARY_DIR)/%.java
	@echo "Compiling $<..."
	$(JAVA_COMP) -d $(JAVA_COMP_OUT_DIR) -sourcepath $(JAVA_COMP_IN_DL) $<
	@echo "Created $@"

# Without this, GNU make inserts an 'rm -rf' not on the recipe and deletes the .jar files
# after making them.  Why make why?
.PRECIOUS: $(JAVA_COMP_OUT_DIR)/%.jar
# Rule to build .jar files from .class files
$(JAVA_COMP_OUT_DIR)/%.jar: $(JAVA_COMP_OUT_DIR)/%.class
	@echo "Building $*..."
	$(JAVA_ARCHIVE) cf $@ -C $(JAVA_COMP_OUT_DIR) $*.class
	@echo "Created $@"

$(EXECUTOR_IN_DIR)/%: $(JVM_IN_DIR)/%.jar
	@echo "Creating script for $*..."
	@echo "#!/usr/bin/env bash" > $(EXECUTOR_IN_DIR)/$*
	@echo "$(JAVA_INTERP) -cp ${CLASSPATH}:${JVM_IN_DP}:$(JVM_IN_DP)/$*.jar $*" \$$\@ >> $(EXECUTOR_IN_DIR)/$*
	chmod +x $(EXECUTOR_IN_DIR)/$*
	@echo "Created script $(EXECUTOR_IN_DIR)/$*"
