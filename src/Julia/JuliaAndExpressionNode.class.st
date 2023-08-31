Class {
	#name : #JuliaAndExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaAndExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAndExpression: self
]
