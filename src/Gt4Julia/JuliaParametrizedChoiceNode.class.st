Class {
	#name : #JuliaParametrizedChoiceNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaParametrizedChoiceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParametrizedChoice: self
]
