Class {
	#name : #JuliaStringNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaStringNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitString: self
]
