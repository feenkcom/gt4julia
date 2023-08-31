Class {
	#name : #JuliaExtendedArgumentListNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaExtendedArgumentListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedArgumentList: self
]
