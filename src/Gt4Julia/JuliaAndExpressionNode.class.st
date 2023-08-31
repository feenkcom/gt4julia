Class {
	#name : #JuliaAndExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaAndExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitAndExpression: self
]
