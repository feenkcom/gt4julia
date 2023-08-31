Extension { #name : #GtSmaCCParserStyler }

{ #category : #'*Julia' }
GtSmaCCParserStyler class >> juliaStyler: aParserClass [
	<smaccStyler: #RustParser priority: 50>
	^ (self forParser: aParserClass)
		stylerRules:
			{(GtSmaCCKeywordTokensStylerRule
				styleBlock: [ :styler | 
					styler
						foreground: Color purple ]).
			(GtSmaCCCommentStylerRule
				styleBlock: [ :styler | styler foreground: Color lightGray ]).
			(GtSmaCCTokenStylerRule
				tokenName: '";"'
				styleBlock: [ :styler | 
					styler
						foreground: Color black;
						bold ]).
			(GtSmaCCNodeVariableStylerRule
				nodeClassName: #SmaCCErrorNode
				variableNames: #(dismissedTokens errorToken)
				styleBlock: [ :styler | styler foreground: Color red ])}
]
