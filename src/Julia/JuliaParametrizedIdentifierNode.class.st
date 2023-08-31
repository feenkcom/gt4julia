Class {
	#name : #JuliaParametrizedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaParametrizedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParametrizedIdentifier: self
]
