Trait {
	#name : #TProgramVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #Julia
}

{ #category : #generated }
TProgramVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]
