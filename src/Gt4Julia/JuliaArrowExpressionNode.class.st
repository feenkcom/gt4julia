Class {
	#name : #JuliaArrowExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaArrowExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrowExpression: self
]
