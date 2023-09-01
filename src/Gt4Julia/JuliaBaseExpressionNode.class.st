Class {
	#name : #JuliaBaseExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaBaseExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBaseExpression: self
]
