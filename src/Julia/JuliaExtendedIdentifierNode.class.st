Class {
	#name : #JuliaExtendedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaExtendedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedIdentifier: self
]
