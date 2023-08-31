Class {
	#name : #JuliaArgumentListNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaArgumentListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitArgumentList: self
]
