Class {
	#name : #JuliaOrExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaOrExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitOrExpression: self
]
