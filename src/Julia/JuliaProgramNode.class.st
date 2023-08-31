Class {
	#name : #JuliaProgramNode,
	#superclass : #SmaCCParseNode,
	#category : #Julia
}

{ #category : #generated }
JuliaProgramNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitProgram: self
]
