Class {
	#name : #JuliaProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
