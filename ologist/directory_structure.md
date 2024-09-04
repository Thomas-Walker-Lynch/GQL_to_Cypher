**directory_structure.txt**

# Property-Based Directory Naming

We think of a directory name as being the value of a property, where this
property is shared by each and every file in said directory.

When developing programs, we use a number of tools that process files. In this
context, these are common property values to think of files having in common:

* `processed_by`
* `category_processed_by`

The `processed_by` property is also known as `input`, which is often shortened
to `in`. For example, C files to be compiled are processed by `cc`, so `cc` is a
fine name for the directory. Other names could be `processed_by_cc`, `cc_input`,
or `cc_in`.

When input files destined to be processed by more than one related program are
mixed in a directory, we generalize to the category. For example, a directory
holding a collection of both Rust and C files could be called `compiler`, where
`compiler` is the property that the related processing programs have. A mix of
interpreted scripts destined to be processed by different interpreters could be
`interpreter`.

Files directly loaded and run by the machine are `processed_by` the architecture
(e.g., `x86`) or `category_processed_by` a `machine`.

An interpreter creates machine code on-the-fly. Calling an interpreter is the
final step in a development chain, similar to calling the loader for a machine
file. So, let us call the loader or the interpreter an `executor`. Thus, files
in such a mixed directory are to be processed by an executor.

The processing of files in a collection can be done by a person. Such is the
case of the directory used by developers when they work, hence such a directory
is called `developer`.

We run into a bit of a problem when there is no word in English for the role a
person plays when processing files in a directory. Such is the case for a
directory full of documentation. The term `reader` comes close, but when you
think about it, everything is a reader. For example, a compiler reads its input
files. I thought to appeal to Latin and use `lector`, which indeed would refer
to a person. However, the term is not intuitive, and people who cannot find this
documentation will not be reading it so as to understand this term.

In such a situation, we can move on to other property values shared by the files
in the directory:

* `purpose_is`
* `is_a`
* `is X`
* `owned_by`

Each file in a documentation directory shares the purpose of being
documentation, hence such directories are called `documentation`.


# Implicit Property Name

The property used when naming a directory is implicit, so coming up with a
directory name is essentially a mental exercise. The reader of the directory
name is left to figure out the shared property value the person had in mind when
naming the directory. 

Adopting a convention makes the task of deriving the property name easier, but
if this is still not sufficient, then integrate the property name into the the
directory name along with the common value.  `is_a_red_car`, might be full of
files that are describing read cars. This examples enters the gray area between
file systems and databases.

Sometimes a directory name will be held in a variable in a script, and we need
to further distinguish the fact that the variable is referring to a
directory. For example, a variable that holds the name of the directory that
holds files to be processed by `javac` can be called `javac_input_directory`, or
for those who want to be swank, `javac_in_dir`.

# Why Directory Names Are Often Singular

Each and every file in a directory has the same property value for a given
property. Hence, this property value comes from the property of a file, 
a single object.

For example, if a directory is named `compiler`, it signifies that each file in
the directory is `processed_by` a `compiler`.

However, there can be cases where the property value, though it comes from an
individual file, will be plural. For example, a directory could conceivably be
named `insights`, where each file in the directory contains multiple
insights. When we look at the property value for a single file, it is plural.

# Hidden Files

In my humble opinion, that git uses hidden files is unfortunate. In general, I
find hidden files in shared projects to be a bad idea. The approach of using a
symbolic link to give hidden files visible names creates a maintenance
problem. The idea of setting explicit parameters for git can be used to force
git to not create hidden files, but this approach does not expose other hidden
files that might be placed into a project repository. There is also an issue of
coordinating with other team members who want hidden files. Hence, a general
solution that solves all these issues is to alias `ls` to `ls -a`, which is done
in the environment initialization file for the project.


<!--  LocalWords:  lector
 -->
