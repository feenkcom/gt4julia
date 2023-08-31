Class {
	#name : #JuliaArrowExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaArrowExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArrowExpression: self
]
