Class {
	#name : #JuliaModifiedTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaModifiedTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModifiedTypedIdentifier: self
]
