Class {
	#name : #JuliaFunctionExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaFunctionExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunctionExpression: self
]
