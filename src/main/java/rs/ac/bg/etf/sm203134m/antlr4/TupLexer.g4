lexer grammar TupLexer;

// literals
TEST: T E S T;
NAME: N A M E;
DESCRIPTION: D E S C R I P T I O N;
STEPS: S T E P S;
EXECUTE: E X E C U T E;
AN: A N;
API: A P I;
REQUEST: R E Q U E S T;
TO: T O;
WITH: W I T H;
HEADERS: H E A D E R S;
BODY: B O D Y;
ASSERT: A S S E R T;
THAT: T H A T;
LAST: L A S T;
RESPONSE: R E S P O N S E;
HAS: H A S;
STATUS: S T A T U S;
CODE: C O D E;
IS: I S;
FIELD: F I E L D;
VALUE: V A L U E;
OPEN: O P E N;
WEB: W E B;
PAGE: P A G E;
CURRENT: C U R R E N T;
CLICK: C L I C K;
ON: O N;
ELEMENT: E L E M E N T;
XPATH: X DASH P A T H;
BROWSER: B R O W S E R;
TITLE: T I T L E;

// general
INTEGER: [0-9]+ ;
STRING: '"' ( ~["\\] | '\\' . )* '"';
STRING_START: '"' -> pushMode(IN_STRING);
SINGLE_QUOTE_STRING: '\'' ( ~['\\] | '\\' . )* '\'';
SINGLE_QUOTE_STRING_START: '\'' -> pushMode(IN_SINGLE_QUOTE_STRING);
IDENTIFIER: [a-zA-Z_]+;


LEFT_SQUARE_BRACKET: '[';
RIGHT_SQUARE_BRACKET: ']';
LEFT_CURLY_BRACKET: '{';
RIGHT_CURLY_BRACKET: '}';
COLON: ':';
COMMA: ',';
DOT: '.';
DASH: '-';

// case insensitivity
fragment A : [aA]; // match either an 'a' or 'A'
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];

// ignore whitespace
WS: [ \t\r\n]+ -> channel(HIDDEN);

/** "catch all" rule for any char not matche in a token rule of your
 *  grammar. Lexers in Intellij must return all tokens good and bad.
 *  There must be a token to cover all characters, which makes sense, for
 *  an IDE. The parser however should not see these bad tokens because
 *  it just confuses the issue. Hence, the hidden channel.
 */
ERRCHAR
	:	.	-> channel(HIDDEN)
	;

mode IN_STRING;

STRING_END
    : '"' -> popMode
    ;

TEXT
    : ( ~["\\] | '\\' . )
    ;

mode IN_SINGLE_QUOTE_STRING;

SINGLE_QUOTE_STRING_END
    : '\'' -> popMode
    ;

SINGLE_QUOTE_TEXT
    : ( ~['\\] | '\\' . )
    ;