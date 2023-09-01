Class {
	#name : #JuliaPlusExpressionNode,
	#superclass : #JuliaProgramNode,
	#instVars : [
		'lhs',
		'rhs'
	],
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaPlusExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPlusExpression: self
]

{ #category : #generated }
JuliaPlusExpressionNode >> lhs [
	^ lhs
]

{ #category : #generated }
JuliaPlusExpressionNode >> lhs: aJuliaProgramNode [
	self lhs notNil ifTrue: [ self lhs parent: nil ].
	lhs := aJuliaProgramNode.
	self lhs notNil ifTrue: [ self lhs parent: self ]
]

{ #category : #generated }
JuliaPlusExpressionNode >> nodeVariables [
	^ #(#lhs #rhs)
]

{ #category : #generated }
JuliaPlusExpressionNode >> rhs [
	^ rhs
]

{ #category : #generated }
JuliaPlusExpressionNode >> rhs: aJuliaProgramNode [
	self rhs notNil ifTrue: [ self rhs parent: nil ].
	rhs := aJuliaProgramNode.
	self rhs notNil ifTrue: [ self rhs parent: self ]
]
