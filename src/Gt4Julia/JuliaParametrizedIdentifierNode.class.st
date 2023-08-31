Class {
	#name : #JuliaParametrizedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaParametrizedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParametrizedIdentifier: self
]
