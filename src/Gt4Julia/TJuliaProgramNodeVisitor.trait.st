Trait {
	#name : #TJuliaProgramNodeVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #Gt4Julia
}

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitAndExpression: anAndExpression [
	^ self visitProgram: anAndExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitArgumentList: anArgumentList [
	^ self visitProgram: anArgumentList
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitArrowExpression: anArrowExpression [
	^ self visitProgram: anArrowExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitAssignmentExpression: anAssignmentExpression [
	^ self visitProgram: anAssignmentExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitBaseExpression: aBaseExpression [
	^ self visitProgram: aBaseExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitBinaryExpression: aBinaryExpression [
	^ self visitProgram: aBinaryExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitCallExpression: aCallExpression [
	^ self visitProgram: aCallExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitConditionalExpression: aConditionalExpression [
	^ self visitProgram: aConditionalExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitElseClause: anElseClause [
	^ self visitProgram: anElseClause
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitElseifClause: anElseifClause [
	^ self visitProgram: anElseifClause
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitExtendedArgumentList: anExtendedArgumentList [
	^ self visitProgram: anExtendedArgumentList
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitExtendedIdentifier: anExtendedIdentifier [
	^ self visitProgram: anExtendedIdentifier
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitExtendedParameterList: anExtendedParameterList [
	^ self visitProgram: anExtendedParameterList
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitExtendedTypedIdentifier: anExtendedTypedIdentifier [
	^ self visitProgram: anExtendedTypedIdentifier
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitFunctionExpression: aFunctionExpression [
	^ self visitProgram: aFunctionExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitModifiedTypedIdentifier: aModifiedTypedIdentifier [
	^ self visitProgram: aModifiedTypedIdentifier
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitModuleExpression: aModuleExpression [
	^ self visitProgram: aModuleExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitOrExpression: anOrExpression [
	^ self visitProgram: anOrExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitPairExpression: aPairExpression [
	^ self visitProgram: aPairExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitParameterList: aParameterList [
	^ self visitProgram: aParameterList
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitParametrizedChoice: aParametrizedChoice [
	^ self visitProgram: aParametrizedChoice
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitParametrizedIdentifier: aParametrizedIdentifier [
	^ self visitProgram: aParametrizedIdentifier
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitPlusExpression: aPlusExpression [
	^ self visitProgram: aPlusExpression
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitProgram: aProgram [
	^ self visitSmaCCParseNode: aProgram
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitStructDefinition: aStructDefinition [
	^ self visitProgram: aStructDefinition
]

{ #category : #generated }
TJuliaProgramNodeVisitor >> visitTypedIdentifier: aTypedIdentifier [
	^ self visitProgram: aTypedIdentifier
]
