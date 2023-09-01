Class {
	#name : #JuliaBinaryExpressionNode,
	#superclass : #JuliaProgramNode,
	#instVars : [
		'lhses',
		'rhses'
	],
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaBinaryExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryExpression: self
]

{ #category : #generated }
JuliaBinaryExpressionNode >> compositeNodeVariables [
	^ #(#lhses #rhses)
]

{ #category : #'generated-initialize-release' }
JuliaBinaryExpressionNode >> initialize [
	super initialize.
	lhses := OrderedCollection new: 2.
	rhses := OrderedCollection new: 2.
]

{ #category : #generated }
JuliaBinaryExpressionNode >> lhses [
	^ lhses
]

{ #category : #generated }
JuliaBinaryExpressionNode >> lhses: anOrderedCollection [
	self setParents: self lhses to: nil.
	lhses := anOrderedCollection.
	self setParents: self lhses to: self
]

{ #category : #generated }
JuliaBinaryExpressionNode >> rhses [
	^ rhses
]

{ #category : #generated }
JuliaBinaryExpressionNode >> rhses: anOrderedCollection [
	self setParents: self rhses to: nil.
	rhses := anOrderedCollection.
	self setParents: self rhses to: self
]
