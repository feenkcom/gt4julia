Class {
	#name : #JuliaModuleExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaModuleExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModuleExpression: self
]
