Class {
	#name : #JuliaArgumentListNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaArgumentListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArgumentList: self
]
