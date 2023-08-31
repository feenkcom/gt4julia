Class {
	#name : #JuliaTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypedIdentifier: self
]
