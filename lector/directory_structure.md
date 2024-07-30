
# Property-Based Directory Naming

We think of a directory name as being the value of a property, where
this property is shared by each and every file in said directory.
These are the properties, in order that we prefer to use them:

* `processed_by`
* `category_processed_by`
* `purpose_of`

The `processed_by` property is also known as `input`, which in turn is
often shortened to `in`.



When source files of different types are mixed in a directory, we generalize 
to the category.  A mix of Rust and C files would be called `compiler` as the 
category of the programs used to process the files. A mix of interpreted scripts
would be `interpreter`.

When a directory contains mixed source files, we generalize to the category. A
directory with Rust and C files is named `compiler`, indicating the category of
programs used to process the files. A directory of interpreted scripts is named
`interpreter`.

Files directly loaded and run by the machine are `processed_by` the architecture
(e.g., `x86`) or `category_processed_by` the `machine`.

An interpreter creates machine code on-the-fly. Calling the interpreter is the
final step, similar calling the loader for a machine file. So we use a category
term of 'exector' for both an interpreter and a loader, so a directory
containing both interpreted files and machine files is named `executor`.

A document is read by a person, so a document is processed by a `reader`. 

In cases where knowing the agent that will process the file does not give the
user insight as to what the file is for, we drop down to the `purpose_of`
property.

# Implicit Property Name

When naming a directory we typically don't add the property name, but only
put its value. Hence the directory that contains files to be processed
by the `javac` program will typically be called `javac`.  When we need to include the
property name, we can add a suffix. `javac_input`. 

Sometimes a directory name will be held in a variable, and we need to further
distinguish the fact that the variable is referring to a directory. Say for
example a variable that holds the name of the directory that holds files
to be processed by `javac`, can be called `javac_input_directory`, and if
that is too long,  `javac_in_dir` is typically used.


# Why directory names are often singular

Each and every file in a directory has the same property value
for a given property. This property value becomes the name of the directory.
This creates an equivalence class of files based on the shared
property. 

For example, if a directory is named ‘compiler’, it signifies that
each file in the directory is processed by a compiler. 

However, there can be cases where the property value, though it comes from an
individual file, will be plural.  For example, a directory could conceivably be
named ‘insights’, where each file in the directory contains multiple insights.
When we look at the property value for a single file, it is plural.

# What is 'lector'

It is a stuffy way to say `processed_by` the `reader`.  At the top level directory
the lector is typically the project manager. In the developer's directory it is
typically the developer.  In general it is anyone who reads the docs.

# Hidden Files

In my humble opinion that git uses hidden files is unfortunate. In general I
find hidden files in shared projects to be a bad idea. The approach of using a
symbolic link to give hidden files visible names creates a maintenance 
problem. The idea of setting explicit parameters for git can be used to
address the git hidden files, but it does not expose other hidden files.
There is also an issue of coordinating with other team members who want
hidden files. Hence, a general solution that solves all these issues is
to alias `ls` to `ls -a`, which is done in the initialization file
for the project.


<!--  LocalWords:  lector
 -->
