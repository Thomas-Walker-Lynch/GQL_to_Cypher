This is a project management log. This is not a code development log. (Git does
a pretty good job of that already.)

2024-07-25

  formal git project directory creation

  Preparation, studies, and discussion occur before this time.
  
2024-09-05

  Diligence to the project was spotty in August. 

  Build environment appears to be stable. A toy grammar syntax parse, and echo,
  and syntax 'diagramming' is working. Here 'diagramming' is a pretty print
  annotation of the syntax parts.
  
  GQL turns out to have a great deal in common with Cypher. So, might start by
  using the Cypher movie database for testing.  The ISO standard document should
  clarify the differences.
  
  The AI could not deal with the GQL grammar due to its size, so would not
  generate a print visitor. I am working on abstracting the grammar to reduce
  the number of rules.

  In said abstraction, all terminal symbols will be under single token
  `terminal`. Currently these are then categorized, then differentiated. The
  categories were created manually. I wonder if categories are necessary, but
  they can't hurt, and as they are done I will keep them.
  
2024-09-11

  I have tried, have a working example of, a synthesis approach, where one
  program synthesizes another program that does the syntax annotation. 

  Also worked on reducing the GQL grammar by abstracting it. For example
  creating one token that stands for all terminal symbols. Though not sure what
  the advantage is of working with the abstracted grammar instead of the
  original, as we will have to make a distinction among the various rules that
  collapsed together before generating the output.

  Now trying to apply rewrite rules to transform tree T0 to tree T1.

  Make does not chain pattern rules, which is causing problems. Everyone in
  Javaland apparently is using Maven or Gradle, so switching over to Gradle.
  
2024-10-01

  Hve moved to gradle and have developed a bespoke dependency graph tool.
  Breaking out the dependency graph tool as its own project, albeit a
  small one.


<!--  LocalWords:  Javaland Gradle
 -->
