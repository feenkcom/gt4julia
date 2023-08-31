Class {
	#name : #JuliaExtendedArgumentListNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaExtendedArgumentListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedArgumentList: self
]
