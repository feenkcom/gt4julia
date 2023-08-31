Class {
	#name : #JuliaExtendedParameterListNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaExtendedParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitExtendedParameterList: self
]
