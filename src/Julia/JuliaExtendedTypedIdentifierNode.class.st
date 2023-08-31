Class {
	#name : #JuliaExtendedTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaExtendedTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedTypedIdentifier: self
]
