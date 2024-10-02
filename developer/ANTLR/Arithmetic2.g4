grammar Arithmetic2;

program:   statement+ EOF;

statement
    : expression
    | variable '=' expression
    ;

expression
    : expression ('*'|'/') expression
    | expression ('+'|'-') expression
    | '(' expression ')'
    | variable
    | INT
    ;

variable: VARIABLE;

INT: [0-9]+;

VARIABLE: [a-zA-Z]+;

WS: [ \t\r\n]+ -> skip;
