Class {
	#name : #JuliaParametrizedChoiceNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaParametrizedChoiceNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitParametrizedChoice: self
]
