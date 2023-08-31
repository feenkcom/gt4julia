Class {
	#name : #JuliaPairExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaPairExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPairExpression: self
]
