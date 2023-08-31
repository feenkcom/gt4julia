Class {
	#name : #JuliaFunctionExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaFunctionExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunctionExpression: self
]
