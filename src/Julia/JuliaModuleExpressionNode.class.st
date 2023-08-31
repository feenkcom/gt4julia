Class {
	#name : #JuliaModuleExpressionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaModuleExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModuleExpression: self
]
