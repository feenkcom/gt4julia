Class {
	#name : #JuliaExtendedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaExtendedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedIdentifier: self
]
