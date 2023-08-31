Class {
	#name : #JuliaElseClauseNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaElseClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElseClause: self
]
