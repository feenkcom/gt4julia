Class {
	#name : #JuliaStructDefinitionNode,
	#superclass : #JuliaProgramNode,
	#category : #Julia
}

{ #category : #generated }
JuliaStructDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStructDefinition: self
]
