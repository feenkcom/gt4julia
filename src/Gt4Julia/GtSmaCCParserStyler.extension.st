Extension { #name : #GtSmaCCParserStyler }

{ #category : #'*Gt4Julia' }
GtSmaCCParserStyler class >> juliaStyler: aParserClass [
	<smaccStyler: #JuliaParser priority: 50>
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
			(GtSmaCCNodeStylerRule
				nodeClassName: #JuliaStringNode
				styleBlock: [ :styler | styler foreground: Color blue ]).
			(GtSmaCCNodeVariableStylerRule
				nodeClassName: #SmaCCErrorNode
				variableNames: #(dismissedTokens errorToken)
				styleBlock: [ :styler | styler foreground: Color red ])}
]
