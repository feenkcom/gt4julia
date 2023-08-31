Class {
	#name : #JuliaStructDefinitionNode,
	#superclass : #JuliaProgramNode,
	#category : #Gt4Julia
}

{ #category : #generated }
JuliaStructDefinitionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitStructDefinition: self
]
