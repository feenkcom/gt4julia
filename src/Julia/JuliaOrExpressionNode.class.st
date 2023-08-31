Class {
	#name : #JuliaOrExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaOrExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitOrExpression: self
]
