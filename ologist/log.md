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
  
  
