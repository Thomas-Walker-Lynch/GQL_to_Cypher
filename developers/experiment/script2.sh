# Create the env_GP file in the executor directory
cat << 'EOF' > ../executor/env_GP
#!/bin/bash
# Environment setup for GP
export GP_PROMPT="GP> "
export PS1="\[$(tput setaf 2)\]\u@\h:\w$GP_PROMPT\[$(tput sgr0)\] "
EOF

# Make sure the file is executable
chmod +x ../executor/env_GP

# Source the env_GP file to set up the environment
source ../executor/env_GP

# Now let's see the current directory contents
ls -l
