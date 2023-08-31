Class {
	#name : #JuliaParser,
	#superclass : #SmaCCGLRParser,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaParser class >> ambiguousTransitions [
^#(
#[ 0 17 0 102] 
#[ 0 21 0 102] 
#[ 0 25 0 102] 
#[ 0 29 0 102] 
#[ 0 33 0 102] 
#[ 0 37 0 102] 
#[ 0 41 0 102] 
#[ 0 45 0 102] 
#[ 0 102 1 1] 
#[ 0 17 0 110] 
#[ 0 21 0 110] 
#[ 0 25 0 110] 
#[ 0 29 0 110] 
#[ 0 33 0 110] 
#[ 0 37 0 110] 
#[ 0 41 0 110] 
#[ 0 45 0 110] 
#[ 0 74 0 142] 
#[ 0 142 0 189] 
#[ 0 54 0 154] 
#[ 0 58 0 158] 
#[ 0 66 0 162] 
#[ 0 58 0 166] 
#[ 0 70 0 170] 
#[ 0 70 0 174]
	).
]

{ #category : #'generated-accessing' }
JuliaParser class >> cacheId [
	^'2023-08-31T12:24:21.363083-05:00'
]

{ #category : #generated }
JuliaParser class >> definitionComment [
"%glr;

%root Program;
%prefix Julia;
%suffix Node;

<timesOperator> : \* | \/ | \÷ | \% | \& | \⋅ | \* | \\;
<plusOperator> : \+ | \-;
<arrowOperator> :  \← | \→;
<assignOpereator> : \:\= | \~ | \$\= | \= | \+\= | \-\= | \*\= |
                        \/\= | \/\/\= | \|\\\=\| | \^\= | \÷\= | \%\= | \&\=;
<whitespace>
	: [\ \t\v]+
	;
<string> : \"" ([^""]* (\\.)?)* \"";
<comment>
	: \#[^\r\n]*
	;

<identifier> : [a-zA-Z]\w*;
<number> : \d+;

<terminator> : \n | \r | \;;

Program : <terminator>* Expressions;

Expressions
	: Expression <terminator>+
	| Expression <terminator>+ Expressions
	;

Expression
	: BinaryExpression
	;
BaseExpression
	: <number>
	| <string> 
	| <identifier>
	| CallExpression
	| ModuleExpression
	| FunctionExpression
	| ConditionalExpression
	| StructDefinition
	;

ModuleExpression : ""module"" ExtendedIdentifier ""end"" {{}};

ExtendedIdentifier
	: <identifier> {{}}
	| <identifier> Expressions {{}}
	;

StructDefinition
	: ""struct"" ExtendedTypedIdentifier ""end"" {{}}
	| ""mutable"" ""struct"" ExtendedTypedIdentifier ""end"" {{}}
	;

ExtendedTypedIdentifier
	: TypedIdentifier {{}}
	| TypedIdentifier <terminator> ExtendedTypedIdentifier {{}}
	;

TypedIdentifier
	: ParametrizedIdentifier {{}}
	| ParametrizedIdentifier ParametrizedChoice ParametrizedIdentifier {{}}
	;

ParametrizedChoice : ""::"" {{}} | ""< :"" {{}};

ParametrizedIdentifier
	: <identifier> {{}}
	| <identifier> ""{"" ModifiedTypedIdentifier ""}"" {{}}
	;

ModifiedTypedIdentifier
	: TypedIdentifier {{}}
	| TypedIdentifier "","" ModifiedTypedIdentifier {{}}
	;

FunctionExpression 
	: ""function"" <identifier> ParameterList {{}}
	|  ""function"" <identifier> ParameterList Expressions ""end"" {{}}
	;

ParameterList : ""("" ExtendedParameterList "")"" {{}};

ExtendedParameterList
	: <identifier> {{}}
	|  <identifier> "",""  ExtendedParameterList {{}}
	;

CallExpression : Expression ArgumentList {{}};

ArgumentList : ""("" ExtendedArgumentList "")"" {{}};

ExtendedArgumentList
	: Expression {{}}
	| Expression "","" ExtendedArgumentList {{}}
	;

BinaryExpression
	: BinaryExpression <timesOperator> PlusExpression {{}}
	| PlusExpression
	;
	

PlusExpression 
	: PlusExpression <plusOperator> ArrowExpression{{}}
	| ArrowExpression
	;

ArrowExpression
	: OrExpression <arrowOperator> ArrowExpression {{}}
	| OrExpression
	;

OrExpression
	: OrExpression ""||"" AndExpression {{}}
	| AndExpression
	;

AndExpression
	: AndExpression ""&&"" AssignmentExpression {{}}
	| AssignmentExpression
	;

AssignmentExpression
	: PairExpression <assignOpereator> AssignmentExpression {{}}
	| PairExpression
	;

PairExpression
	: Expression ""=>"" PairExpression {{}}
	| BaseExpression
	;

ConditionalExpression
	: ""if"" Expression Expressions {{}}
	| ""if"" Expression Expressions ElseifClause {{}}
	| ""if"" Expression Expressions ElseifClause ElseClause{{}}
	;

ElseifClause
	: ""elseif"" Expression Expressions {{}}
	| ""elseif"" Expression Expressions ElseifClause {{}}
	;

ElseClause : ""else"" Expressions {{}};"
]

{ #category : #generated }
JuliaParser class >> reduceTable [
^#(
	#(31 0 #nil 494593 false) 
	#(35 1 #liftFirstValue: 644098 false) 
	#(35 1 #liftFirstValue: 644099 false) 
	#(35 1 #liftFirstValue: 644097 false) 
	#(31 2 #liftFirstValue: 494594 false) 
	#(30 2 #liftFirstValue: 484353 false) 
	#(56 1 #liftFirstValue: 2623490 false) 
	#(35 1 #liftFirstValue: 644101 false) 
	#(35 1 #liftFirstValue: 644104 false) 
	#(35 1 #liftFirstValue: 644102 false) 
	#(35 1 #liftFirstValue: 644100 false) 
	#(34 1 #liftFirstValue: 609281 false) 
	#(50 1 #liftFirstValue: 2063362 false) 
	#(51 1 #liftFirstValue: 2162690 false) 
	#(52 1 #liftFirstValue: 2256898 false) 
	#(53 1 #liftFirstValue: 2348034 false) 
	#(54 1 #liftFirstValue: 2423810 false) 
	#(55 1 #liftFirstValue: 2515970 false) 
	#(35 1 #liftFirstValue: 644103 false) 
	#(37 1 #reduceActionForExtendedIdentifier1: 874497 false) 
	#(42 1 #reduceActionForParametrizedIdentifier1: 1371137 false) 
	#(39 1 #reduceActionForExtendedTypedIdentifier1: 1081345 false) 
	#(40 1 #reduceActionForTypedIdentifier1: 1197057 false) 
	#(33 1 #liftFirstValue: 549889 false) 
	#(32 2 #liftFirstValue: 523265 false) 
	#(47 2 #reduceActionForCallExpression1: 1871873 false) 
	#(44 3 #reduceActionForFunctionExpression1: 1581057 false) 
	#(57 3 #reduceActionForConditionalExpression1: 2701313 false) 
	#(37 2 #reduceActionForExtendedIdentifier1: 874498 false) 
	#(36 3 #reduceActionForModuleExpression1: 813057 false) 
	#(38 3 #reduceActionForStructDefinition1: 953345 false) 
	#(41 1 #reduceActionForParametrizedChoice1: 1324033 false) 
	#(41 1 #reduceActionForParametrizedChoice1: 1324034 false) 
	#(49 1 #reduceActionForExtendedArgumentList1: 1973249 false) 
	#(56 3 #reduceActionForPairExpression1: 2623489 false) 
	#(33 2 #liftFirstValue: 549890 false) 
	#(32 3 #liftFirstValue: 523266 false) 
	#(50 3 #reduceActionForBinaryExpression1: 2063361 false) 
	#(51 3 #reduceActionForPlusExpression1: 2162689 false) 
	#(53 3 #reduceActionForOrExpression1: 2348033 false) 
	#(52 3 #reduceActionForArrowExpression1: 2256897 false) 
	#(54 3 #reduceActionForAndExpression1: 2423809 false) 
	#(55 3 #reduceActionForAssignmentExpression1: 2515969 false) 
	#(46 1 #reduceActionForExtendedParameterList1: 1773569 false) 
	#(57 4 #reduceActionForConditionalExpression1: 2701314 false) 
	#(38 4 #reduceActionForStructDefinition1: 953346 false) 
	#(43 1 #reduceActionForModifiedTypedIdentifier1: 1474561 false) 
	#(39 3 #reduceActionForExtendedTypedIdentifier2: 1081346 false) 
	#(40 3 #reduceActionForTypedIdentifier1: 1197058 false) 
	#(48 3 #reduceActionForArgumentList1: 1921025 false) 
	#(45 3 #reduceActionForParameterList1: 1719297 false) 
	#(44 5 #reduceActionForFunctionExpression1: 1581058 false) 
	#(57 5 #reduceActionForConditionalExpression1: 2701315 false) 
	#(42 4 #reduceActionForParametrizedIdentifier1: 1371138 false) 
	#(49 3 #reduceActionForExtendedTypedIdentifier2: 1973250 false) 
	#(46 3 #reduceActionForExtendedTypedIdentifier2: 1773570 false) 
	#(58 3 #reduceActionForElseifClause1: 2875393 false) 
	#(59 2 #reduceActionForElseClause1: 2988033 false) 
	#(43 3 #reduceActionForExtendedTypedIdentifier2: 1474562 false) 
	#(58 4 #reduceActionForElseifClause2: 2875394 false)
	).
]

{ #category : #generated }
JuliaParser class >> scannerClass [
	^JuliaScanner
]

{ #category : #generated }
JuliaParser class >> startingStateForProgram [
	^ 1
]

{ #category : #generated }
JuliaParser class >> symbolNames [
	^ #('"&&"' '"("' '")"' '","' '"::"' '"< :"' '"=>"' '"else"' '"elseif"' '"end"' '"function"' '"if"' '"module"' '"mutable"' '"struct"' '"{"' '"||"' '"}"' '<timesOperator>' '<plusOperator>' '<arrowOperator>' '<assignOpereator>' '<whitespace>' '<string>' '<comment>' '<identifier>' '<number>' '<terminator>' 'B e g i n' 'Program' '<terminator>*' 'Expressions' '<terminator>+' 'Expression' 'BaseExpression' 'ModuleExpression' 'ExtendedIdentifier' 'StructDefinition' 'ExtendedTypedIdentifier' 'TypedIdentifier' 'ParametrizedChoice' 'ParametrizedIdentifier' 'ModifiedTypedIdentifier' 'FunctionExpression' 'ParameterList' 'ExtendedParameterList' 'CallExpression' 'ArgumentList' 'ExtendedArgumentList' 'BinaryExpression' 'PlusExpression' 'ArrowExpression' 'OrExpression' 'AndExpression' 'AssignmentExpression' 'PairExpression' 'ConditionalExpression' 'ElseifClause' 'ElseClause' 'E O F' 'error')
]

{ #category : #generated }
JuliaParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken nil nil nil #Object #SmaCCToken #Object #Object #JuliaModuleExpressionNode #JuliaExtendedIdentifierNode #JuliaStructDefinitionNode #JuliaExtendedTypedIdentifierNode #JuliaTypedIdentifierNode #JuliaParametrizedChoiceNode #JuliaParametrizedIdentifierNode #JuliaModifiedTypedIdentifierNode #JuliaFunctionExpressionNode #JuliaParameterListNode #JuliaExtendedParameterListNode #JuliaCallExpressionNode #JuliaArgumentListNode #JuliaExtendedArgumentListNode #Object #Object #Object #Object #Object #Object #Object #JuliaConditionalExpressionNode #JuliaElseifClauseNode #JuliaElseClauseNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
JuliaParser class >> transitionTable [
^#(
#[1 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 6 0 24 0 6 0 26 0 6 0 27 0 6 0 28 0 9 0 30 0 13 0 31] 
#[0 0 0 0 60] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 49 0 28 0 53 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[0 0 113 0 26] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 117 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 121 0 26 0 125 0 37] 
#[0 0 129 0 15] 
#[1 0 133 0 26 0 137 0 39 0 141 0 40 0 145 0 42] 
#[0 0 10 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 14 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 18 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 22 0 11 0 12 0 13 0 14 0 15 0 24 0 26 0 27 0 28] 
#[0 0 26 0 60] 
#[1 0 149 0 2 0 153 0 7 0 161 0 28 0 161 0 33 0 165 0 48] 
#[0 0 30 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 34 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 38 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 42 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 46 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 50 0 2 0 50 0 3 0 50 0 4 0 50 0 7 0 50 0 11 0 50 0 12 0 50 0 13 0 50 0 14 0 50 0 15 0 169 0 19 0 50 0 24 0 50 0 26 0 50 0 27 0 50 0 28] 
#[1 0 54 0 2 0 54 0 3 0 54 0 4 0 54 0 7 0 54 0 11 0 54 0 12 0 54 0 13 0 54 0 14 0 54 0 15 0 54 0 19 0 173 0 20 0 54 0 24 0 54 0 26 0 54 0 27 0 54 0 28] 
#[0 0 58 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 19 0 20 0 24 0 26 0 27 0 28] 
#[1 0 62 0 2 0 62 0 3 0 62 0 4 0 62 0 7 0 62 0 11 0 62 0 12 0 62 0 13 0 62 0 14 0 62 0 15 0 177 0 17 0 62 0 19 0 62 0 20 0 181 0 21 0 62 0 24 0 62 0 26 0 62 0 27 0 62 0 28] 
#[1 0 185 0 1 0 66 0 2 0 66 0 3 0 66 0 4 0 66 0 7 0 66 0 11 0 66 0 12 0 66 0 13 0 66 0 14 0 66 0 15 0 66 0 17 0 66 0 19 0 66 0 20 0 66 0 21 0 66 0 24 0 66 0 26 0 66 0 27 0 66 0 28] 
#[0 0 70 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 24 0 26 0 27 0 28] 
#[1 0 74 0 1 0 74 0 2 0 74 0 3 0 74 0 4 0 74 0 7 0 74 0 11 0 74 0 12 0 74 0 13 0 74 0 14 0 74 0 15 0 74 0 17 0 74 0 19 0 74 0 20 0 74 0 21 0 189 0 22 0 74 0 24 0 74 0 26 0 74 0 27 0 74 0 28] 
#[0 0 78 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 193 0 2 0 197 0 45] 
#[1 0 149 0 2 0 153 0 7 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 201 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 165 0 48 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 82 0 10 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 205 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[0 0 209 0 10] 
#[1 0 133 0 26 0 213 0 39 0 141 0 40 0 145 0 42] 
#[1 0 86 0 4 0 86 0 5 0 86 0 6 0 86 0 10 0 217 0 16 0 86 0 18 0 86 0 28] 
#[0 0 221 0 10] 
#[1 0 90 0 10 0 225 0 28] 
#[1 0 94 0 4 0 229 0 5 0 233 0 6 0 94 0 10 0 94 0 18 0 94 0 28 0 237 0 41] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 241 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 245 0 49 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 253 0 24 0 253 0 26 0 253 0 27 0 249 0 34 0 253 0 35 0 253 0 36 0 253 0 38 0 253 0 44 0 253 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 253 0 56 0 253 0 57] 
#[0 0 98 0 1 0 2 0 3 0 4 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28 0 60] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 7 0 102 0 8 0 102 0 9 0 102 0 10 0 7 0 11 0 11 0 12 0 15 0 13 0 19 0 14 0 23 0 15 0 102 0 17 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 22 0 27 0 24 0 31 0 26 0 35 0 27 0 39 0 28 1 5 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57 0 102 0 60] 
#[0 0 106 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 1 9 0 51 1 9 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 1 13 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 1 17 0 54 1 17 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 1 21 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 1 25 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 249 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 1 29 0 55 0 105 0 56 0 105 0 57] 
#[1 1 33 0 26 1 37 0 46] 
#[1 0 110 0 1 0 110 0 2 0 110 0 3 0 110 0 4 0 110 0 7 0 43 0 11 0 47 0 12 0 51 0 13 0 55 0 14 0 59 0 15 0 110 0 17 0 110 0 19 0 110 0 20 0 110 0 21 0 110 0 22 0 63 0 24 0 67 0 26 0 71 0 27 0 110 0 28 1 41 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 114 0 1 0 114 0 2 0 114 0 3 0 114 0 4 0 114 0 7 1 45 0 9 0 114 0 11 0 114 0 12 0 114 0 13 0 114 0 14 0 114 0 15 0 114 0 17 0 114 0 19 0 114 0 20 0 114 0 21 0 114 0 22 0 114 0 24 0 114 0 26 0 114 0 27 0 114 0 28 1 49 0 58] 
#[0 0 118 0 10] 
#[0 0 122 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 1 53 0 10] 
#[1 0 133 0 26 1 57 0 40 0 145 0 42 1 61 0 43] 
#[0 0 126 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 133 0 26 1 65 0 39 0 141 0 40 0 145 0 42] 
#[0 0 130 0 26] 
#[0 0 134 0 26] 
#[1 0 133 0 26 1 69 0 42] 
#[1 0 149 0 2 0 138 0 3 1 73 0 4 0 153 0 7 0 165 0 48] 
#[0 1 77 0 3] 
#[1 0 149 0 2 0 153 0 7 0 165 0 48] 
#[1 0 75 0 1 0 75 0 2 0 142 0 3 0 142 0 4 0 75 0 7 0 142 0 11 0 142 0 12 0 142 0 13 0 142 0 14 0 142 0 15 0 75 0 17 0 75 0 19 0 75 0 20 0 75 0 21 0 79 0 22 0 142 0 24 0 142 0 26 0 142 0 27 0 142 0 28] 
#[0 0 146 0 1 0 2 0 3 0 4 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28 0 60] 
#[0 0 150 0 1 0 2 0 3 0 4 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28 0 60] 
#[1 0 83 0 2 0 154 0 3 0 154 0 4 0 83 0 7 0 154 0 11 0 154 0 12 0 154 0 13 0 154 0 14 0 154 0 15 0 83 0 19 0 173 0 20 0 154 0 24 0 154 0 26 0 154 0 27 0 154 0 28] 
#[1 0 87 0 2 0 158 0 3 0 158 0 4 0 87 0 7 0 158 0 11 0 158 0 12 0 158 0 13 0 158 0 14 0 158 0 15 0 87 0 19 0 87 0 20 0 158 0 24 0 158 0 26 0 158 0 27 0 158 0 28] 
#[1 0 185 0 1 0 91 0 2 0 162 0 3 0 162 0 4 0 91 0 7 0 162 0 11 0 162 0 12 0 162 0 13 0 162 0 14 0 162 0 15 0 91 0 17 0 91 0 19 0 91 0 20 0 91 0 21 0 162 0 24 0 162 0 26 0 162 0 27 0 162 0 28] 
#[1 0 95 0 2 0 166 0 3 0 166 0 4 0 95 0 7 0 166 0 11 0 166 0 12 0 166 0 13 0 166 0 14 0 166 0 15 0 95 0 19 0 95 0 20 0 166 0 24 0 166 0 26 0 166 0 27 0 166 0 28] 
#[1 0 99 0 1 0 99 0 2 0 170 0 3 0 170 0 4 0 99 0 7 0 170 0 11 0 170 0 12 0 170 0 13 0 170 0 14 0 170 0 15 0 99 0 17 0 99 0 19 0 99 0 20 0 99 0 21 0 170 0 24 0 170 0 26 0 170 0 27 0 170 0 28] 
#[1 0 103 0 1 0 103 0 2 0 174 0 3 0 174 0 4 0 103 0 7 0 174 0 11 0 174 0 12 0 174 0 13 0 174 0 14 0 174 0 15 0 103 0 17 0 103 0 19 0 103 0 20 0 103 0 21 0 174 0 24 0 174 0 26 0 174 0 27 0 174 0 28] 
#[1 0 178 0 3 1 81 0 4] 
#[0 1 85 0 3] 
#[0 1 89 0 10] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 1 93 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 182 0 1 0 182 0 2 0 182 0 3 0 182 0 4 0 182 0 7 1 97 0 8 0 182 0 11 0 182 0 12 0 182 0 13 0 182 0 14 0 182 0 15 0 182 0 17 0 182 0 19 0 182 0 20 0 182 0 21 0 182 0 22 0 182 0 24 0 182 0 26 0 182 0 27 0 182 0 28 1 101 0 59] 
#[0 0 186 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 1 105 0 4 0 190 0 18] 
#[0 1 109 0 18] 
#[0 0 194 0 10] 
#[0 0 198 0 4 0 10 0 18 0 28] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 0 241 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 1 113 0 49 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[0 0 202 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 1 33 0 26 1 117 0 46] 
#[0 0 206 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 210 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 149 0 2 0 153 0 7 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 1 121 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 165 0 48 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[1 0 17 0 11 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15 0 105 0 24 0 105 0 26 0 105 0 27 1 125 0 32 0 57 0 34 0 105 0 35 0 105 0 36 0 105 0 38 0 105 0 44 0 105 0 47 0 81 0 50 0 85 0 51 0 85 0 52 0 93 0 53 0 97 0 54 0 97 0 55 0 105 0 56 0 105 0 57] 
#[0 0 214 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[1 0 133 0 26 1 57 0 40 0 145 0 42 1 129 0 43] 
#[0 0 218 0 4 0 5 0 6 0 10 0 18 0 28] 
#[0 0 222 0 3] 
#[0 0 226 0 3] 
#[1 0 230 0 1 0 230 0 2 0 230 0 3 0 230 0 4 0 230 0 7 0 230 0 8 1 45 0 9 0 230 0 11 0 230 0 12 0 230 0 13 0 230 0 14 0 230 0 15 0 230 0 17 0 230 0 19 0 230 0 20 0 230 0 21 0 230 0 22 0 230 0 24 0 230 0 26 0 230 0 27 0 230 0 28 1 133 0 58] 
#[0 0 234 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28] 
#[0 0 238 0 18] 
#[0 0 242 0 1 0 2 0 3 0 4 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 26 0 27 0 28]
	).
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForAndExpression1: nodes [
	| result |
	result := JuliaAndExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForArgumentList1: nodes [
	| result |
	result := JuliaArgumentListNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForArrowExpression1: nodes [
	| result |
	result := JuliaArrowExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForAssignmentExpression1: nodes [
	| result |
	result := JuliaAssignmentExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForBinaryExpression1: nodes [
	| result |
	result := JuliaBinaryExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForCallExpression1: nodes [
	| result |
	result := JuliaCallExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForConditionalExpression1: nodes [
	| result |
	result := JuliaConditionalExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForElseClause1: nodes [
	| result |
	result := JuliaElseClauseNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForElseifClause1: nodes [
	| result |
	result := JuliaElseifClauseNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForElseifClause2: nodes [
	| result |
	result := nodes at: 4.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForExtendedArgumentList1: nodes [
	| result |
	result := JuliaExtendedArgumentListNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForExtendedIdentifier1: nodes [
	| result |
	result := JuliaExtendedIdentifierNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForExtendedParameterList1: nodes [
	| result |
	result := JuliaExtendedParameterListNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForExtendedTypedIdentifier1: nodes [
	| result |
	result := JuliaExtendedTypedIdentifierNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForExtendedTypedIdentifier2: nodes [
	| result |
	result := nodes at: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForFunctionExpression1: nodes [
	| result |
	result := JuliaFunctionExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForModifiedTypedIdentifier1: nodes [
	| result |
	result := JuliaModifiedTypedIdentifierNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForModuleExpression1: nodes [
	| result |
	result := JuliaModuleExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForOrExpression1: nodes [
	| result |
	result := JuliaOrExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForPairExpression1: nodes [
	| result |
	result := JuliaPairExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForParameterList1: nodes [
	| result |
	result := JuliaParameterListNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForParametrizedChoice1: nodes [
	| result |
	result := JuliaParametrizedChoiceNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForParametrizedIdentifier1: nodes [
	| result |
	result := JuliaParametrizedIdentifierNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForPlusExpression1: nodes [
	| result |
	result := JuliaPlusExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForStructDefinition1: nodes [
	| result |
	result := JuliaStructDefinitionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForTypedIdentifier1: nodes [
	| result |
	result := JuliaTypedIdentifierNode new.
	^ result
]
