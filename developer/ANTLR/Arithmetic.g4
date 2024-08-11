grammar Arithmetic;

program:   expression EOF;

expression
    : expression ('*'|'/') expression
    | expression ('+'|'-') expression
    | '(' expression ')'
    | INT
    ;

INT: [0-9]+;

WS: [ \t\r\n]+ -> skip;
