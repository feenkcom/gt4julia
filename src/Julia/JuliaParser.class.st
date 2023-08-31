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
	^'2023-08-31T16:32:21.029174+02:00'
]

{ #category : #generated }
JuliaParser class >> definitionComment [
"%glr;

%root Program;
%prefix Julia;
%suffix Node;

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

<terminator> : \n | \;;

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

<identifier> : /[a-zA-Z]\w*/;
<number> : /\d+/;
String : <quote> Characters <quote> {{}};
Characters : Character | Character Characters;
Character : <identifier> | <number>;

<timesOperator> : ""*"" | ""/"" | ""÷"" | ""%"" | ""&"" | ""⋅"" | ""*"" | ""\\"";
<plusOperator> : ""+"" | ""-"";
<arrowOperator> :  ""←"" | ""→"";
<assignOpereator> : "":="" | ""~"" | ""$="" | ""="" | ""+="" | ""-="" | ""*="" |
                        ""/="" | ""//="" | ""|\=|"" | ""^="" | ""÷="" | ""%="" | ""&="";
<comment> : \#|.*;
<quote> : "";"
]

{ #category : #generated }
JuliaParser class >> reduceTable [
^#(
	#(31 1 #liftFirstValue: 162819 false) 
	#(31 1 #liftFirstValue: 162817 false) 
	#(31 1 #liftFirstValue: 162828 false) 
	#(29 1 #liftFirstValue: 54273 false) 
	#(52 1 #reduceActionForPairExpression2: 2269186 false) 
	#(31 1 #liftFirstValue: 162822 false) 
	#(31 1 #liftFirstValue: 162827 false) 
	#(31 1 #liftFirstValue: 162823 false) 
	#(31 1 #liftFirstValue: 162821 false) 
	#(31 1 #liftFirstValue: 162824 false) 
	#(46 1 #reduceActionForBinaryExpression2: 1678338 false) 
	#(47 1 #reduceActionForPlusExpression2: 1782786 false) 
	#(48 1 #reduceActionForArrowExpression2: 1882114 false) 
	#(49 1 #reduceActionForOrExpression2: 1978370 false) 
	#(31 1 #liftFirstValue: 162826 false) 
	#(50 1 #reduceActionForAndExpression2: 2059266 false) 
	#(51 1 #reduceActionForAssignmentExpression2: 2156546 false) 
	#(31 1 #liftFirstValue: 162820 false) 
	#(31 1 #liftFirstValue: 162825 false) 
	#(31 1 #liftFirstValue: 162818 false) 
	#(33 1 #reduceActionForExtendedIdentifier1: 489473 false) 
	#(38 1 #reduceActionForParametrizedIdentifier1: 986113 false) 
	#(35 1 #reduceActionForExtendedTypedIdentifier1: 696321 false) 
	#(36 1 #reduceActionForTypedIdentifier1: 812033 false) 
	#(58 1 #liftFirstValue: 2813953 false) 
	#(58 1 #liftFirstValue: 2813954 false) 
	#(57 1 #liftFirstValue: 2765825 false) 
	#(30 2 #liftFirstValue: 78849 false) 
	#(43 2 #reduceActionForCallExpression1: 1486849 false) 
	#(40 3 #reduceActionForFunctionExpression1: 1196033 false) 
	#(53 3 #reduceActionForConditionalExpression1: 2347009 false) 
	#(33 2 #reduceActionForExtendedIdentifier1: 489474 false) 
	#(32 3 #reduceActionForModuleExpression1: 428033 false) 
	#(34 3 #reduceActionForStructDefinition1: 568321 false) 
	#(37 1 #reduceActionForParametrizedChoice1: 939009 false) 
	#(37 1 #reduceActionForParametrizedChoice1: 939010 false) 
	#(56 3 #reduceActionForString1: 2722817 false) 
	#(57 2 #liftFirstValue: 2765826 false) 
	#(45 1 #reduceActionForExtendedArgumentList1: 1588225 false) 
	#(52 3 #reduceActionForPairExpression1: 2269185 false) 
	#(30 3 #liftFirstValue: 78850 false) 
	#(46 3 #reduceActionForBinaryExpression1: 1678337 false) 
	#(47 3 #reduceActionForBinaryExpression1: 1782785 false) 
	#(49 3 #reduceActionForBinaryExpression1: 1978369 false) 
	#(48 3 #reduceActionForPairExpression1: 1882113 false) 
	#(50 3 #reduceActionForBinaryExpression1: 2059265 false) 
	#(51 3 #reduceActionForPairExpression1: 2156545 false) 
	#(42 1 #reduceActionForExtendedParameterList1: 1388545 false) 
	#(53 4 #reduceActionForConditionalExpression1: 2347010 false) 
	#(34 4 #reduceActionForStructDefinition1: 568322 false) 
	#(39 1 #reduceActionForModifiedTypedIdentifier1: 1089537 false) 
	#(35 3 #reduceActionForPairExpression1: 696322 false) 
	#(36 3 #reduceActionForTypedIdentifier1: 812034 false) 
	#(44 3 #reduceActionForArgumentList1: 1536001 false) 
	#(41 3 #reduceActionForParameterList1: 1334273 false) 
	#(40 5 #reduceActionForFunctionExpression1: 1196034 false) 
	#(53 5 #reduceActionForConditionalExpression1: 2347011 false) 
	#(38 4 #reduceActionForParametrizedIdentifier1: 986114 false) 
	#(45 3 #reduceActionForPairExpression1: 1588226 false) 
	#(42 3 #reduceActionForPairExpression1: 1388546 false) 
	#(54 3 #reduceActionForElseifClause1: 2521089 false) 
	#(55 2 #reduceActionForElseClause1: 2633729 false) 
	#(39 3 #reduceActionForPairExpression1: 1089538 false) 
	#(54 4 #reduceActionForElseifClause2: 2521090 false)
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
	^ #('"&&"' '"("' '")"' '","' '"::"' '"< :"' '"="' '"else"' '"elseif"' '"end"' '"function"' '"if"' '"module"' '"mutable"' '"struct"' '"{"' '"||"' '"}"' '<terminator>' '<identifier>' '<number>' '<timesOperator>' '<plusOperator>' '<arrowOperator>' '<assignOpereator>' '<comment>' '<quote>' 'B e g i n' 'Program' 'Expressions' 'Expression' 'ModuleExpression' 'ExtendedIdentifier' 'StructDefinition' 'ExtendedTypedIdentifier' 'TypedIdentifier' 'ParametrizedChoice' 'ParametrizedIdentifier' 'ModifiedTypedIdentifier' 'FunctionExpression' 'ParameterList' 'ExtendedParameterList' 'CallExpression' 'ArgumentList' 'ExtendedArgumentList' 'BinaryExpression' 'PlusExpression' 'ArrowExpression' 'OrExpression' 'AndExpression' 'AssignmentExpression' 'PairExpression' 'ConditionalExpression' 'ElseifClause' 'ElseClause' 'String' 'Characters' 'Character' 'E O F' 'error')
]

{ #category : #generated }
JuliaParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #Object #Object #Object #Object #JuliaModuleExpressionNode #JuliaExtendedIdentifierNode #JuliaStructDefinitionNode #JuliaExtendedTypedIdentifierNode #JuliaTypedIdentifierNode #JuliaParametrizedChoiceNode #JuliaParametrizedIdentifierNode #JuliaModifiedTypedIdentifierNode #JuliaFunctionExpressionNode #JuliaParameterListNode #JuliaExtendedParameterListNode #JuliaCallExpressionNode #JuliaArgumentListNode #JuliaExtendedArgumentListNode #JuliaBinaryExpressionNode #JuliaPlusExpressionNode #JuliaArrowExpressionNode #JuliaOrExpressionNode #JuliaAndExpressionNode #JuliaAssignmentExpressionNode #JuliaPairExpressionNode #JuliaConditionalExpressionNode #JuliaElseifClauseNode #JuliaElseClauseNode #JuliaStringNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
JuliaParser class >> transitionTable [
^#(
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 53 0 20 0 53 0 21 0 53 0 26 0 41 0 27 0 45 0 29 0 45 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[0 0 109 0 20] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 113 0 20 0 113 0 21 0 113 0 26 0 41 0 27 0 113 0 31 0 113 0 32 0 113 0 34 0 113 0 40 0 113 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 113 0 53 0 113 0 56] 
#[1 0 117 0 20 0 121 0 33] 
#[0 0 125 0 15] 
#[1 0 129 0 20 0 133 0 35 0 137 0 36 0 141 0 38] 
#[0 0 6 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 10 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 14 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 157 0 20 0 157 0 21 0 153 0 57 0 157 0 58] 
#[0 0 0 0 59] 
#[0 0 18 0 59] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 22 0 17 0 15 0 19 0 22 0 22 0 22 0 23 0 22 0 24 0 22 0 25 0 173 0 44] 
#[0 0 26 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 30 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 34 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 38 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 42 0 1 0 42 0 2 0 42 0 3 0 42 0 4 0 42 0 7 0 42 0 11 0 42 0 12 0 42 0 13 0 42 0 14 0 42 0 15 0 42 0 17 0 42 0 19 0 42 0 20 0 42 0 21 0 19 0 22 0 42 0 23 0 42 0 24 0 42 0 25 0 42 0 26 0 42 0 27] 
#[1 0 46 0 1 0 46 0 2 0 46 0 3 0 46 0 4 0 46 0 7 0 46 0 11 0 46 0 12 0 46 0 13 0 46 0 14 0 46 0 15 0 46 0 17 0 46 0 19 0 46 0 20 0 46 0 21 0 46 0 22 0 23 0 23 0 46 0 24 0 46 0 25 0 46 0 26 0 46 0 27] 
#[0 0 50 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 54 0 1 0 54 0 2 0 54 0 3 0 54 0 4 0 54 0 7 0 54 0 11 0 54 0 12 0 54 0 13 0 54 0 14 0 54 0 15 0 27 0 17 0 54 0 19 0 54 0 20 0 54 0 21 0 54 0 22 0 54 0 23 0 31 0 24 0 54 0 25 0 54 0 26 0 54 0 27] 
#[1 0 35 0 1 0 58 0 2 0 58 0 3 0 58 0 4 0 58 0 7 0 58 0 11 0 58 0 12 0 58 0 13 0 58 0 14 0 58 0 15 0 58 0 17 0 58 0 19 0 58 0 20 0 58 0 21 0 58 0 22 0 58 0 23 0 58 0 24 0 58 0 25 0 58 0 26 0 58 0 27] 
#[0 0 39 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 43 0 1 0 43 0 2 0 43 0 3 0 43 0 4 0 43 0 7 0 43 0 11 0 43 0 12 0 43 0 13 0 43 0 14 0 43 0 15 0 43 0 17 0 43 0 19 0 43 0 20 0 43 0 21 0 43 0 22 0 43 0 23 0 43 0 24 0 47 0 25 0 43 0 26 0 43 0 27] 
#[0 0 78 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 82 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 201 0 2 0 205 0 41] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 51 0 11 0 55 0 12 0 59 0 13 0 63 0 14 0 67 0 15 0 22 0 17 0 71 0 20 0 75 0 21 0 22 0 22 0 22 0 23 0 22 0 24 0 22 0 25 0 79 0 26 0 83 0 27 0 209 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 173 0 44 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[1 0 86 0 10 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 53 0 20 0 53 0 21 0 53 0 26 0 41 0 27 0 213 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[0 0 217 0 10] 
#[1 0 129 0 20 0 221 0 35 0 137 0 36 0 141 0 38] 
#[1 0 90 0 4 0 90 0 5 0 90 0 6 0 90 0 10 0 225 0 16 0 90 0 18 0 90 0 19] 
#[0 0 229 0 10] 
#[1 0 94 0 10 0 233 0 19] 
#[1 0 98 0 4 0 237 0 5 0 241 0 6 0 98 0 10 0 98 0 18 0 98 0 19 0 245 0 37] 
#[0 0 102 0 20 0 21 0 27] 
#[0 0 106 0 20 0 21 0 27] 
#[0 0 249 0 27] 
#[1 0 157 0 20 0 157 0 21 0 110 0 27 0 253 0 57 0 157 0 58] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 1 0 20 1 1 0 21 1 1 0 26 0 41 0 27 1 1 0 31 1 1 0 32 1 1 0 34 1 1 0 40 1 1 0 43 1 5 0 45 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 1 0 53 1 1 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 1 13 0 52 1 9 0 53 1 9 0 56] 
#[1 0 114 0 1 0 114 0 2 0 114 0 3 0 114 0 4 0 114 0 7 0 114 0 8 0 114 0 9 0 114 0 10 0 87 0 11 0 91 0 12 0 95 0 13 0 99 0 14 0 103 0 15 0 114 0 17 0 114 0 19 0 107 0 20 0 111 0 21 0 114 0 22 0 114 0 23 0 114 0 24 0 114 0 25 0 115 0 26 0 119 0 27 1 17 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56 0 114 0 59] 
#[0 0 118 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 1 21 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 1 25 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 1 29 0 50 0 93 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 1 33 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 1 37 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 9 0 20 1 9 0 21 1 9 0 26 0 41 0 27 1 9 0 31 1 9 0 32 1 9 0 34 1 9 0 40 1 9 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 1 41 0 51 0 97 0 52 1 9 0 53 1 9 0 56] 
#[1 1 45 0 20 1 49 0 42] 
#[1 0 122 0 1 0 122 0 2 0 122 0 3 0 122 0 4 0 122 0 7 0 123 0 11 0 127 0 12 0 131 0 13 0 135 0 14 0 139 0 15 0 122 0 17 0 122 0 19 0 143 0 20 0 147 0 21 0 122 0 22 0 122 0 23 0 122 0 24 0 122 0 25 0 151 0 26 0 155 0 27 1 53 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[1 0 126 0 1 0 126 0 2 0 126 0 3 0 126 0 4 0 126 0 7 1 57 0 9 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 126 0 15 0 126 0 17 0 126 0 19 0 126 0 20 0 126 0 21 0 126 0 22 0 126 0 23 0 126 0 24 0 126 0 25 0 126 0 26 0 126 0 27 1 61 0 54] 
#[0 0 130 0 10] 
#[0 0 134 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 1 65 0 10] 
#[1 0 129 0 20 1 69 0 36 0 141 0 38 1 73 0 39] 
#[0 0 138 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 129 0 20 1 77 0 35 0 137 0 36 0 141 0 38] 
#[0 0 142 0 20] 
#[0 0 146 0 20] 
#[1 0 129 0 20 1 81 0 38] 
#[0 0 150 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 154 0 27] 
#[1 0 22 0 1 0 7 0 2 0 159 0 3 0 163 0 4 0 11 0 7 0 22 0 17 0 22 0 22 0 22 0 23 0 22 0 24 0 22 0 25 0 173 0 44] 
#[0 1 89 0 3] 
#[1 0 22 0 1 0 7 0 2 0 22 0 3 0 22 0 4 0 11 0 7 0 22 0 11 0 22 0 12 0 22 0 13 0 22 0 14 0 22 0 15 0 22 0 17 0 22 0 19 0 22 0 20 0 22 0 21 0 22 0 22 0 22 0 23 0 22 0 24 0 22 0 25 0 22 0 26 0 22 0 27 0 173 0 44] 
#[1 0 167 0 1 0 167 0 2 0 167 0 3 0 167 0 4 0 167 0 7 0 167 0 11 0 167 0 12 0 167 0 13 0 167 0 14 0 167 0 15 0 167 0 17 0 167 0 19 0 167 0 20 0 167 0 21 0 167 0 22 0 167 0 23 0 167 0 24 0 171 0 25 0 167 0 26 0 167 0 27] 
#[0 0 166 0 1 0 2 0 3 0 4 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 59] 
#[1 0 175 0 1 0 175 0 2 0 175 0 3 0 175 0 4 0 175 0 7 0 175 0 11 0 175 0 12 0 175 0 13 0 175 0 14 0 175 0 15 0 175 0 17 0 175 0 19 0 175 0 20 0 175 0 21 0 175 0 22 0 179 0 23 0 175 0 24 0 175 0 25 0 175 0 26 0 175 0 27] 
#[0 0 183 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 187 0 1 0 191 0 2 0 191 0 3 0 191 0 4 0 191 0 7 0 191 0 11 0 191 0 12 0 191 0 13 0 191 0 14 0 191 0 15 0 191 0 17 0 191 0 19 0 191 0 20 0 191 0 21 0 191 0 22 0 191 0 23 0 191 0 24 0 191 0 25 0 191 0 26 0 191 0 27] 
#[0 0 195 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 199 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 203 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 194 0 3 1 93 0 4] 
#[0 1 97 0 3] 
#[0 1 101 0 10] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 105 0 20 1 105 0 21 1 105 0 26 0 41 0 27 1 105 0 31 1 105 0 32 1 105 0 34 1 105 0 40 1 105 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 105 0 53 1 105 0 56] 
#[1 0 198 0 1 0 198 0 2 0 198 0 3 0 198 0 4 0 198 0 7 1 109 0 8 0 198 0 11 0 198 0 12 0 198 0 13 0 198 0 14 0 198 0 15 0 198 0 17 0 198 0 19 0 198 0 20 0 198 0 21 0 198 0 22 0 198 0 23 0 198 0 24 0 198 0 25 0 198 0 26 0 198 0 27 1 113 0 55] 
#[0 0 202 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 1 117 0 4 0 206 0 18] 
#[0 1 121 0 18] 
#[0 0 210 0 10] 
#[0 0 214 0 4 0 10 0 18 0 19] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 1 1 0 20 1 1 0 21 1 1 0 26 0 41 0 27 1 1 0 31 1 1 0 32 1 1 0 34 1 1 0 40 1 1 0 43 1 125 0 45 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 1 1 0 53 1 1 0 56] 
#[0 0 218 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 1 45 0 20 1 129 0 42] 
#[0 0 222 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 226 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 22 0 1 0 7 0 2 0 11 0 7 0 51 0 11 0 55 0 12 0 59 0 13 0 63 0 14 0 67 0 15 0 22 0 17 0 71 0 20 0 75 0 21 0 22 0 22 0 22 0 23 0 22 0 24 0 22 0 25 0 79 0 26 0 83 0 27 1 133 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 173 0 44 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[1 0 9 0 11 0 13 0 12 0 17 0 13 0 21 0 14 0 25 0 15 0 53 0 20 0 53 0 21 0 53 0 26 0 41 0 27 1 137 0 30 0 53 0 31 0 53 0 32 0 53 0 34 0 53 0 40 0 53 0 43 0 73 0 46 0 77 0 47 0 81 0 48 0 85 0 49 0 89 0 50 0 93 0 51 0 97 0 52 0 53 0 53 0 53 0 56] 
#[0 0 230 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[1 0 129 0 20 1 69 0 36 0 141 0 38 1 141 0 39] 
#[0 0 234 0 4 0 5 0 6 0 10 0 18 0 19] 
#[0 0 238 0 3] 
#[0 0 242 0 3] 
#[1 0 246 0 1 0 246 0 2 0 246 0 3 0 246 0 4 0 246 0 7 0 246 0 8 1 57 0 9 0 246 0 11 0 246 0 12 0 246 0 13 0 246 0 14 0 246 0 15 0 246 0 17 0 246 0 19 0 246 0 20 0 246 0 21 0 246 0 22 0 246 0 23 0 246 0 24 0 246 0 25 0 246 0 26 0 246 0 27 1 145 0 54] 
#[0 0 250 0 1 0 2 0 3 0 4 0 7 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27] 
#[0 0 254 0 18] 
#[0 1 2 0 1 0 2 0 3 0 4 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27]
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
