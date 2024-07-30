grammar GQL;

root: query+ EOF;

query: '{' field+ '}';

field: ID ':' value;

value: STRING | number;

number: INT | FLOAT;

ID: [a-zA-Z_][a-zA-Z_0-9]*;
STRING: '"' .*? '"';
INT: [0-9]+;
FLOAT: [0-9]+ '.' [0-9]+;
WS: [ \t\n\r]+ -> skip;
