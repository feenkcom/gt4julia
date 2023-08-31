Class {
	#name : #JuliaExtendedTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaExtendedTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedTypedIdentifier: self
]
