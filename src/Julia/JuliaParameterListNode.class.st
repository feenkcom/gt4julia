Class {
	#name : #JuliaParameterListNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParameterList: self
]
