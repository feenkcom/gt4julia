Trait {
	#name : #TProgramVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #Gt4Julia
}

{ #category : #generated }
TProgramVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]
