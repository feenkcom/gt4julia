Class {
	#name : #JuliaExtendedParameterListNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaExtendedParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedParameterList: self
]
