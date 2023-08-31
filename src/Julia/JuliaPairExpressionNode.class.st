Class {
	#name : #JuliaPairExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaPairExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPairExpression: self
]
