Class {
	#name : #JuliaStringNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaStringNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitString: self
]
