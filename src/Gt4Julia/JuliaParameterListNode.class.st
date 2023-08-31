Class {
	#name : #JuliaParameterListNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParameterList: self
]
