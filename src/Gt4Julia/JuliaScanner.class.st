Class {
	#name : #JuliaScanner,
	#superclass : #SmaCCScanner,
	#category : #Gt4Julia
}

{ #category : #'generated-initialization' }
JuliaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(26 'else' 8) #(26 'elseif' 9) #(26 'end' 10) #(26 'function' 11) #(26 'if' 12) #(26 'module' 13) #(26 'mutable' 14) #(26 'struct' 15))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JuliaScanner >> emptySymbolTokenId [
	^ 60
]

{ #category : #generated }
JuliaScanner >> errorTokenId [
	^ 61
]

{ #category : #generated }
JuliaScanner >> scan1 [
	[ self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	currentCharacter == $\ ifTrue: [ ^ self scan2 ].
	true ] whileTrue
]

{ #category : #generated }
JuliaScanner >> scan2 [
	[ self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(24).
			self step.
			currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(24) ].
			currentCharacter == $\ ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter == $\ ] whileTrue.
	^ self scan1
]

{ #category : #generated }
JuliaScanner >> scan3 [
	self step.
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForToken [
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan1 ].
	currentCharacter == $# ifTrue: [ ^ self scanForTokenX2 ].
	currentCharacter == $& ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $( ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $) ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $, ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $: ifTrue: [ ^ self scanForTokenX9 ].
	currentCharacter == $< ifTrue: [ ^ self scanForTokenX10 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX8 ].
	currentCharacter == ${ ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self scanForTokenX13
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1 [
	[ self recordMatch: #(26).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX10 [
	self step.
	currentCharacter == Character space
		ifTrue: [ self step.
			currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(6) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX11 [
	[ self recordMatch: #(27).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX12 [
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scanForTokenX1 ].
	(currentCharacter == Character tab
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter == Character space ] ])
		ifTrue: [ ^ self scanForTokenX6 ].
	(currentCharacter == Character lf
		or: [ currentCharacter == Character cr or: [ currentCharacter == $; ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(28) ].
	('%*÷' includes: currentCharacter)
		ifTrue: [ self recordMatch: #(19).
			self step.
			currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ] ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX13 [
	currentCharacter == $| ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $} ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter == $~ ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter isDigit ifTrue: [ ^ self scanForTokenX11 ].
	('$^' includes: currentCharacter) ifTrue: [ ^ self scan3 ].
	(currentCharacter between: $+ and: $-) ifTrue: [ ^ self scanForTokenX7 ].
	(currentCharacter == $\ or: [ currentCharacter = (Character value: 8901) ])
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	(currentCharacter = (Character value: 8592)
		or: [ currentCharacter = (Character value: 8594) ])
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	^ self scanForTokenX12
]

{ #category : #generated }
JuliaScanner >> scanForTokenX2 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX3 [
	self step.
	currentCharacter == $\
		ifTrue: [ (self scanForString: '=|') ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			^ self reportLastMatch ].
	currentCharacter == $| ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX4 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX5 [
	self recordMatch: #(19).
	self step.
	currentCharacter == $& ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX6 [
	[ self recordMatch: #(23).
	self step.
	currentCharacter == Character tab
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter == Character space ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX7 [
	self recordMatch: #(20).
	self step.
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX8 [
	self recordMatch: #(22).
	self step.
	currentCharacter == $> ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX9 [
	self step.
	currentCharacter == $: ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $= ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace nil #comment)
]
