Class {
	#name : #JuliaElseifClauseNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaElseifClauseNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitElseifClause: self
]
