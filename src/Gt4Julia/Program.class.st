Class {
	#name : #Program,
	#superclass : #SmaCCParseNode,
	#category : #Gt4Julia
}

{ #category : #generated }
Program >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
