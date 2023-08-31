Class {
	#name : #JuliaPlusExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaPlusExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPlusExpression: self
]
