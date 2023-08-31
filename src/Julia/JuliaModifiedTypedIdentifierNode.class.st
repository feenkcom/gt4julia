Class {
	#name : #JuliaModifiedTypedIdentifierNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaModifiedTypedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModifiedTypedIdentifier: self
]
