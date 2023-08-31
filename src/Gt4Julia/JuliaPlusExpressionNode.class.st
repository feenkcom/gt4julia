Class {
	#name : #JuliaPlusExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaPlusExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPlusExpression: self
]
