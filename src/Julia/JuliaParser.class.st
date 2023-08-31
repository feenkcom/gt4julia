Class {
	#name : #JuliaParser,
	#superclass : #SmaCCGLRParser,
	#category : #Julia
}

{ #category : #generated }
JuliaParser class >> ambiguousTransitions [
^#(
#[ 0 22 0 161] 
#[ 0 22 0 165] 
#[ 0 22 0 169] 
#[ 0 42 0 177] 
#[ 0 46 0 181] 
#[ 0 54 0 185] 
#[ 0 54 0 189] 
#[ 0 58 0 193] 
#[ 0 62 0 66] 
#[ 0 70 0 74] 
#[ 0 70 0 74 0 197] 
#[ 0 9 0 22] 
#[ 0 13 0 22] 
#[ 0 17 0 22] 
#[ 0 21 0 22] 
#[ 0 22 0 25] 
#[ 0 22 0 29] 
#[ 0 22 0 33] 
#[ 0 22 0 37] 
#[ 0 22 0 41] 
#[ 0 9 0 114] 
#[ 0 13 0 114] 
#[ 0 17 0 114] 
#[ 0 21 0 114] 
#[ 0 25 0 114] 
#[ 0 29 0 114] 
#[ 0 33 0 114] 
#[ 0 37 0 114] 
#[ 0 41 0 114] 
#[ 0 9 0 122] 
#[ 0 13 0 122] 
#[ 0 17 0 122] 
#[ 0 21 0 122] 
#[ 0 25 0 122] 
#[ 0 29 0 122] 
#[ 0 33 0 122] 
#[ 0 37 0 122] 
#[ 0 41 0 122] 
#[ 0 22 0 158] 
#[ 0 22 1 85] 
#[ 0 70 0 74 0 162] 
#[ 0 70 0 74 0 162 0 197] 
#[ 0 46 0 170] 
#[ 0 46 0 170 0 181] 
#[ 0 50 0 174] 
#[ 0 58 0 178 0 193] 
#[ 0 58 0 178] 
#[ 0 50 0 182] 
#[ 0 62 0 66 0 186] 
#[ 0 62 0 66 0 190]
	).
]

{ #category : #'generated-accessing' }
JuliaParser class >> cacheId [
	^'2023-08-31T16:57:30.101544+02:00'
]

{ #category : #generated }
JuliaParser class >> definitionComment [
"%glr;

%root Program;
%prefix Julia;
%suffix Node;

<timesOperator> : ""*"" | ""/"" | ""÷"" | ""%"" | ""&"" | ""⋅"" | ""*"" | ""\\"";
<plusOperator> : ""+"" | ""-"";
<arrowOperator> :  ""←"" | ""→"";
<assignOpereator> : "":="" | ""~"" | ""$="" | ""="" | ""+="" | ""-="" | ""*="" |
                        ""/="" | ""//="" | ""|\=|"" | ""^="" | ""÷="" | ""%="" | ""&="";
<whitespace>
	: \s+
	;
<quote> : "";
<comment>
	: \#|[^\r\n]*
	;

<identifier> : /[a-zA-Z]\w*/;
<number> : /\d+/;

<terminator> : \n | \;;

Program : Expressions;

Expressions
	: Expression <terminator>
	| Expression <terminator> Expressions
	;

Expression
	: <number>
	| String 
	| <identifier>
	| PairExpression
	| CallExpression
	| ModuleExpression
	| FunctionExpression
	| BinaryExpression
	| ConditionalExpression
	| AssignmentExpression
	| StructDefinition
	| <comment>
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
	| PlusExpression {{}}
	;
	

PlusExpression 
	: PlusExpression <plusOperator> ArrowExpression{{}}
	| ArrowExpression {{}}
	;

ArrowExpression
	: OrExpression <arrowOperator> ArrowExpression {{}}
	| OrExpression {{}}
	;

OrExpression
	: OrExpression ""||"" AndExpression {{}}
	| AndExpression {{}}
	;

AndExpression
	: AndExpression ""&&"" AssignmentExpression {{}}
	| AssignmentExpression {{}}
	;

AssignmentExpression
	: PairExpression <assignOpereator> AssignmentExpression {{}}
	| PairExpression {{}}
	;

PairExpression
	: Expression ""="" PairExpression {{}}
	| Expression {{}}
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

ElseClause : ""else"" Expressions {{}};

String : <quote> Characters <quote> {{}};
Characters : Character | Character Characters;
Character : <identifier> | <number>;"
]

{ #category : #generated }
JuliaParser class >> reduceTable [
^#(
	#(32 1 #liftFirstValue: 578572 false) 
	#(32 1 #liftFirstValue: 578563 false) 
	#(32 1 #liftFirstValue: 578561 false) 
	#(30 1 #liftFirstValue: 470017 false) 
	#(53 1 #reduceActionForPairExpression2: 2659330 false) 
	#(32 1 #liftFirstValue: 578566 false) 
	#(32 1 #liftFirstValue: 578571 false) 
	#(32 1 #liftFirstValue: 578567 false) 
	#(32 1 #liftFirstValue: 578565 false) 
	#(32 1 #liftFirstValue: 578568 false) 
	#(47 1 #reduceActionForBinaryExpression2: 2068482 false) 
	#(48 1 #reduceActionForPlusExpression2: 2172930 false) 
	#(49 1 #reduceActionForArrowExpression2: 2272258 false) 
	#(50 1 #reduceActionForOrExpression2: 2368514 false) 
	#(32 1 #liftFirstValue: 578570 false) 
	#(51 1 #reduceActionForAndExpression2: 2449410 false) 
	#(32 1 #liftFirstValue: 578564 false) 
	#(52 1 #reduceActionForAssignmentExpression2: 2546690 false) 
	#(32 1 #liftFirstValue: 578569 false) 
	#(32 1 #liftFirstValue: 578562 false) 
	#(34 1 #reduceActionForExtendedIdentifier1: 879617 false) 
	#(39 1 #reduceActionForParametrizedIdentifier1: 1376257 false) 
	#(36 1 #reduceActionForExtendedTypedIdentifier1: 1086465 false) 
	#(37 1 #reduceActionForTypedIdentifier1: 1202177 false) 
	#(59 1 #liftFirstValue: 3154945 false) 
	#(59 1 #liftFirstValue: 3154946 false) 
	#(58 1 #liftFirstValue: 3106817 false) 
	#(31 2 #liftFirstValue: 494593 false) 
	#(44 2 #reduceActionForCallExpression1: 1876993 false) 
	#(41 3 #reduceActionForFunctionExpression1: 1586177 false) 
	#(54 3 #reduceActionForConditionalExpression1: 2737153 false) 
	#(34 2 #reduceActionForExtendedIdentifier1: 879618 false) 
	#(33 3 #reduceActionForModuleExpression1: 818177 false) 
	#(35 3 #reduceActionForStructDefinition1: 958465 false) 
	#(38 1 #reduceActionForParametrizedChoice1: 1329153 false) 
	#(38 1 #reduceActionForParametrizedChoice1: 1329154 false) 
	#(57 3 #reduceActionForString1: 3063809 false) 
	#(58 2 #liftFirstValue: 3106818 false) 
	#(46 1 #reduceActionForExtendedArgumentList1: 1978369 false) 
	#(53 3 #reduceActionForPairExpression1: 2659329 false) 
	#(31 3 #liftFirstValue: 494594 false) 
	#(47 3 #reduceActionForBinaryExpression1: 2068481 false) 
	#(48 3 #reduceActionForBinaryExpression1: 2172929 false) 
	#(50 3 #reduceActionForBinaryExpression1: 2368513 false) 
	#(49 3 #reduceActionForPairExpression1: 2272257 false) 
	#(51 3 #reduceActionForBinaryExpression1: 2449409 false) 
	#(52 3 #reduceActionForPairExpression1: 2546689 false) 
	#(43 1 #reduceActionForExtendedParameterList1: 1778689 false) 
	#(54 4 #reduceActionForConditionalExpression1: 2737154 false) 
	#(35 4 #reduceActionForStructDefinition1: 958466 false) 
	#(40 1 #reduceActionForModifiedTypedIdentifier1: 1479681 false) 
	#(36 3 #reduceActionForPairExpression1: 1086466 false) 
	#(37 3 #reduceActionForTypedIdentifier1: 1202178 false) 
	#(45 3 #reduceActionForArgumentList1: 1926145 false) 
	#(42 3 #reduceActionForParameterList1: 1724417 false) 
	#(41 5 #reduceActionForFunctionExpression1: 1586178 false) 
	#(54 5 #reduceActionForConditionalExpression1: 2737155 false) 
	#(39 4 #reduceActionForParametrizedIdentifier1: 1376258 false) 
	#(46 3 #reduceActionForPairExpression1: 1978370 false) 
	#(43 3 #reduceActionForPairExpression1: 1778690 false) 
	#(55 3 #reduceActionForElseifClause1: 2911233 false) 
	#(56 2 #reduceActionForElseClause1: 3023873 false) 
	#(40 3 #reduceActionForPairExpression1: 1479682 false) 
	#(55 4 #reduceActionForElseifClause2: 2911234 false)
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
	^ #('"&&"' '"("' '")"' '","' '"::"' '"< :"' '"="' '"else"' '"elseif"' '"end"' '"function"' '"if"' '"module"' '"mutable"' '"struct"' '"{"' '"||"' '"}"' '<timesOperator>' '<plusOperator>' '<arrowOperator>' '<assignOpereator>' '<whitespace>' '<quote>' '<comment>' '<identifier>' '<number>' '<terminator>' 'B e g i n' 'Program' 'Expressions' 'Expression' 'ModuleExpression' 'ExtendedIdentifier' 'StructDefinition' 'ExtendedTypedIdentifier' 'TypedIdentifier' 'ParametrizedChoice' 'ParametrizedIdentifier' 'ModifiedTypedIdentifier' 'FunctionExpression' 'ParameterList' 'ExtendedParameterList' 'CallExpression' 'ArgumentList' 'ExtendedArgumentList' 'BinaryExpression' 'PlusExpression' 'ArrowExpression' 'OrExpression' 'AndExpression' 'AssignmentExpression' 'PairExpression' 'ConditionalExpression' 'ElseifClause' 'ElseClause' 'String' 'Characters' 'Character' 'E O F' 'error')
]

{ #category : #generated }
JuliaParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #Object #Object #Object #Object #JuliaModuleExpressionNode #JuliaExtendedIdentifierNode #JuliaStructDefinitionNode #JuliaExtendedTypedIdentifierNode #JuliaTypedIdentifierNode #JuliaParametrizedChoiceNode #JuliaParametrizedIdentifierNode #JuliaModifiedTypedIdentifierNode #JuliaFunctionExpressionNode #JuliaParameterListNode #JuliaExtendedParameterListNode #JuliaCallExpressionNode #JuliaArgumentListNode #JuliaExtendedArgumentListNode #JuliaBinaryExpressionNode #JuliaPlusExpressionNode #JuliaArrowExpressionNode #JuliaOrExpressionNode #JuliaAndExpressionNode #JuliaAssignmentExpressionNode #JuliaPairExpressionNode #JuliaConditionalExpressionNode #JuliaElseifClauseNode #JuliaElseClauseNode #JuliaStringNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
JuliaParser class >> transitionTable [
^#(
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 0 53 0 25 0 53 0 26 0 53 0 27 0 45 0 30 0 45 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[0 0 109 0 26] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 0 113 0 25 0 113 0 26 0 113 0 27 0 113 0 32 0 113 0 33 0 113 0 35 0 113 0 41 0 113 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 113 0 54 0 113 0 57] 
#[1 0 117 0 26 0 121 0 34] 
#[0 0 125 0 15] 
#[1 0 129 0 26 0 133 0 36 0 137 0 37 0 141 0 39] 
#[1 0 157 0 26 0 157 0 27 0 153 0 58 0 157 0 59] 
#[0 0 6 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 10 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 14 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 0 0 60] 
#[0 0 18 0 60] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 15 0 28 0 173 0 45] 
#[0 0 26 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 30 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 34 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 38 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 42 0 1 0 42 0 2 0 42 0 3 0 42 0 4 0 42 0 7 0 42 0 11 0 42 0 12 0 42 0 13 0 42 0 14 0 42 0 15 0 42 0 17 0 19 0 19 0 42 0 20 0 42 0 21 0 42 0 22 0 42 0 24 0 42 0 25 0 42 0 26 0 42 0 27 0 42 0 28] 
#[1 0 46 0 1 0 46 0 2 0 46 0 3 0 46 0 4 0 46 0 7 0 46 0 11 0 46 0 12 0 46 0 13 0 46 0 14 0 46 0 15 0 46 0 17 0 46 0 19 0 23 0 20 0 46 0 21 0 46 0 22 0 46 0 24 0 46 0 25 0 46 0 26 0 46 0 27 0 46 0 28] 
#[0 0 50 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 54 0 1 0 54 0 2 0 54 0 3 0 54 0 4 0 54 0 7 0 54 0 11 0 54 0 12 0 54 0 13 0 54 0 14 0 54 0 15 0 27 0 17 0 54 0 19 0 54 0 20 0 31 0 21 0 54 0 22 0 54 0 24 0 54 0 25 0 54 0 26 0 54 0 27 0 54 0 28] 
#[1 0 35 0 1 0 58 0 2 0 58 0 3 0 58 0 4 0 58 0 7 0 58 0 11 0 58 0 12 0 58 0 13 0 58 0 14 0 58 0 15 0 58 0 17 0 58 0 19 0 58 0 20 0 58 0 21 0 58 0 22 0 58 0 24 0 58 0 25 0 58 0 26 0 58 0 27 0 58 0 28] 
#[0 0 39 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 43 0 1 0 43 0 2 0 43 0 3 0 43 0 4 0 43 0 7 0 43 0 11 0 43 0 12 0 43 0 13 0 43 0 14 0 43 0 15 0 43 0 17 0 43 0 19 0 43 0 20 0 43 0 21 0 47 0 22 0 43 0 24 0 43 0 25 0 43 0 26 0 43 0 27 0 43 0 28] 
#[0 0 78 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 82 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 201 0 2 0 205 0 42] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 51 0 11 0 55 0 12 0 59 0 13 0 63 0 14 0 67 0 15 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 71 0 24 0 75 0 25 0 79 0 26 0 83 0 27 0 209 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 173 0 45 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[1 0 86 0 10 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 0 53 0 25 0 53 0 26 0 53 0 27 0 213 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[0 0 217 0 10] 
#[1 0 129 0 26 0 221 0 36 0 137 0 37 0 141 0 39] 
#[1 0 90 0 4 0 90 0 5 0 90 0 6 0 90 0 10 0 225 0 16 0 90 0 18 0 90 0 28] 
#[0 0 229 0 10] 
#[1 0 94 0 10 0 233 0 28] 
#[1 0 98 0 4 0 237 0 5 0 241 0 6 0 98 0 10 0 98 0 18 0 98 0 28 0 245 0 38] 
#[0 0 102 0 24 0 26 0 27] 
#[0 0 106 0 24 0 26 0 27] 
#[0 0 249 0 24] 
#[1 0 110 0 24 0 157 0 26 0 157 0 27 0 253 0 58 0 157 0 59] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 1 0 25 1 1 0 26 1 1 0 27 1 1 0 32 1 1 0 33 1 1 0 35 1 1 0 41 1 1 0 44 1 5 0 46 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 1 0 54 1 1 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 1 13 0 53 1 9 0 54 1 9 0 57] 
#[1 0 114 0 1 0 114 0 2 0 114 0 3 0 114 0 4 0 114 0 7 0 114 0 8 0 114 0 9 0 114 0 10 0 87 0 11 0 91 0 12 0 95 0 13 0 99 0 14 0 103 0 15 0 114 0 17 0 114 0 19 0 114 0 20 0 114 0 21 0 114 0 22 0 107 0 24 0 111 0 25 0 115 0 26 0 119 0 27 0 114 0 28 1 17 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57 0 114 0 60] 
#[0 0 118 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 1 21 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 1 25 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 1 29 0 51 0 93 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 1 33 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 1 37 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 9 0 25 1 9 0 26 1 9 0 27 1 9 0 32 1 9 0 33 1 9 0 35 1 9 0 41 1 9 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 1 41 0 52 0 97 0 53 1 9 0 54 1 9 0 57] 
#[1 1 45 0 26 1 49 0 43] 
#[1 0 122 0 1 0 122 0 2 0 122 0 3 0 122 0 4 0 122 0 7 0 123 0 11 0 127 0 12 0 131 0 13 0 135 0 14 0 139 0 15 0 122 0 17 0 122 0 19 0 122 0 20 0 122 0 21 0 122 0 22 0 143 0 24 0 147 0 25 0 151 0 26 0 155 0 27 0 122 0 28 1 53 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[1 0 126 0 1 0 126 0 2 0 126 0 3 0 126 0 4 0 126 0 7 1 57 0 9 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 126 0 15 0 126 0 17 0 126 0 19 0 126 0 20 0 126 0 21 0 126 0 22 0 126 0 24 0 126 0 25 0 126 0 26 0 126 0 27 0 126 0 28 1 61 0 55] 
#[0 0 130 0 10] 
#[0 0 134 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 1 65 0 10] 
#[1 0 129 0 26 1 69 0 37 0 141 0 39 1 73 0 40] 
#[0 0 138 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 129 0 26 1 77 0 36 0 137 0 37 0 141 0 39] 
#[0 0 142 0 26] 
#[0 0 146 0 26] 
#[1 0 129 0 26 1 81 0 39] 
#[0 0 150 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 154 0 24] 
#[1 0 22 0 1 0 7 0 2 0 159 0 3 0 163 0 4 0 11 0 7 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 173 0 45] 
#[0 1 89 0 3] 
#[1 0 22 0 1 0 7 0 2 0 22 0 3 0 22 0 4 0 11 0 7 0 22 0 11 0 22 0 12 0 22 0 13 0 22 0 14 0 22 0 15 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 22 0 24 0 22 0 25 0 22 0 26 0 22 0 27 0 22 0 28 0 173 0 45] 
#[1 0 167 0 1 0 167 0 2 0 167 0 3 0 167 0 4 0 167 0 7 0 167 0 11 0 167 0 12 0 167 0 13 0 167 0 14 0 167 0 15 0 167 0 17 0 167 0 19 0 167 0 20 0 167 0 21 0 171 0 22 0 167 0 24 0 167 0 25 0 167 0 26 0 167 0 27 0 167 0 28] 
#[0 0 166 0 1 0 2 0 3 0 4 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 60] 
#[1 0 175 0 1 0 175 0 2 0 175 0 3 0 175 0 4 0 175 0 7 0 175 0 11 0 175 0 12 0 175 0 13 0 175 0 14 0 175 0 15 0 175 0 17 0 175 0 19 0 179 0 20 0 175 0 21 0 175 0 22 0 175 0 24 0 175 0 25 0 175 0 26 0 175 0 27 0 175 0 28] 
#[0 0 183 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 187 0 1 0 191 0 2 0 191 0 3 0 191 0 4 0 191 0 7 0 191 0 11 0 191 0 12 0 191 0 13 0 191 0 14 0 191 0 15 0 191 0 17 0 191 0 19 0 191 0 20 0 191 0 21 0 191 0 22 0 191 0 24 0 191 0 25 0 191 0 26 0 191 0 27 0 191 0 28] 
#[0 0 195 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 199 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 203 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 194 0 3 1 93 0 4] 
#[0 1 97 0 3] 
#[0 1 101 0 10] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 105 0 25 1 105 0 26 1 105 0 27 1 105 0 32 1 105 0 33 1 105 0 35 1 105 0 41 1 105 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 105 0 54 1 105 0 57] 
#[1 0 198 0 1 0 198 0 2 0 198 0 3 0 198 0 4 0 198 0 7 1 109 0 8 0 198 0 11 0 198 0 12 0 198 0 13 0 198 0 14 0 198 0 15 0 198 0 17 0 198 0 19 0 198 0 20 0 198 0 21 0 198 0 22 0 198 0 24 0 198 0 25 0 198 0 26 0 198 0 27 0 198 0 28 1 113 0 56] 
#[0 0 202 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 1 117 0 4 0 206 0 18] 
#[0 1 121 0 18] 
#[0 0 210 0 10] 
#[0 0 214 0 4 0 10 0 18 0 28] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 1 1 0 25 1 1 0 26 1 1 0 27 1 1 0 32 1 1 0 33 1 1 0 35 1 1 0 41 1 1 0 44 1 125 0 46 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 1 1 0 54 1 1 0 57] 
#[0 0 218 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 1 45 0 26 1 129 0 43] 
#[0 0 222 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 226 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 51 0 11 0 55 0 12 0 59 0 13 0 63 0 14 0 67 0 15 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 71 0 24 0 75 0 25 0 79 0 26 0 83 0 27 1 133 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 173 0 45 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 29 0 24 0 53 0 25 0 53 0 26 0 53 0 27 1 137 0 31 0 53 0 32 0 53 0 33 0 53 0 35 0 53 0 41 0 53 0 44 0 73 0 47 0 77 0 48 0 81 0 49 0 85 0 50 0 89 0 51 0 93 0 52 0 97 0 53 0 53 0 54 0 53 0 57] 
#[0 0 230 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[1 0 129 0 26 1 69 0 37 0 141 0 39 1 141 0 40] 
#[0 0 234 0 4 0 5 0 6 0 10 0 18 0 28] 
#[0 0 238 0 3] 
#[0 0 242 0 3] 
#[1 0 246 0 1 0 246 0 2 0 246 0 3 0 246 0 4 0 246 0 7 0 246 0 8 1 57 0 9 0 246 0 11 0 246 0 12 0 246 0 13 0 246 0 14 0 246 0 15 0 246 0 17 0 246 0 19 0 246 0 20 0 246 0 21 0 246 0 22 0 246 0 24 0 246 0 25 0 246 0 26 0 246 0 27 0 246 0 28 1 145 0 55] 
#[0 0 250 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28] 
#[0 0 254 0 18] 
#[0 1 2 0 1 0 2 0 3 0 4 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28]
	).
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForAndExpression2: nodes [
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
JuliaParser >> reduceActionForArrowExpression2: nodes [
	| result |
	result := JuliaArrowExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForAssignmentExpression2: nodes [
	| result |
	result := JuliaAssignmentExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForBinaryExpression1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForBinaryExpression2: nodes [
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
JuliaParser >> reduceActionForOrExpression2: nodes [
	| result |
	result := JuliaOrExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForPairExpression1: nodes [
	| result |
	result := nodes at: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForPairExpression2: nodes [
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
JuliaParser >> reduceActionForPlusExpression2: nodes [
	| result |
	result := JuliaPlusExpressionNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JuliaParser >> reduceActionForString1: nodes [
	| result |
	result := JuliaStringNode new.
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
