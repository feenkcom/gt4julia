Class {
	#name : #Program,
	#superclass : #SmaCCParseNode,
	#category : #Julia
}

{ #category : #generated }
Program >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
