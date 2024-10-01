
Directories are named after the agent that uses the files in them. See
`readers/directory_naming.txt` for more information.

The top level directory is reserved for project management. This includes
the git repo, virtual environment tool installs, and the startup scripts.

An `executor` is a generic name for a program that runs a file. It is used to
name directories that might have a mix of directly loaded, interpreted, and
shell script files. Files in an 'exector' directory are for the executor.



Document readers will find material in the 'readers' directory.

As you are reading this you might be a GQL_to_Cypter-ologist.  Please read
documents in the ./ologist directory for project information, and the
documents in the developer/ologist directory for documents on building
the project.

The project top level is for project management and imported tools. Developers
do development work in the `developer` directory.

For developers, from the top of the project get started by typing:
```
> . executor/env_dev
``

This will setup the environment and `cd` to the developer directory.  (`env_dev`
is analogous to the Python virtual environment `activate`.)

# About

This is a project to develope a transpiler from GQL to Cypher.




