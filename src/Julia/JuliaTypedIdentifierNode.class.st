Class {
	#name : #JuliaTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypedIdentifier: self
]
