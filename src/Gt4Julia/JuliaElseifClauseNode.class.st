Class {
	#name : #JuliaElseifClauseNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaElseifClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElseifClause: self
]
