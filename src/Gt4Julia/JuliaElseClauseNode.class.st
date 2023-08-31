Class {
	#name : #JuliaElseClauseNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaElseClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElseClause: self
]
