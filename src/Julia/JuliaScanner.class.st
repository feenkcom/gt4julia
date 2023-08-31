Class {
	#name : #JuliaScanner,
	#superclass : #SmaCCScanner,
	#category : #Julia
}

{ #category : #'generated-initialization' }
JuliaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(26 '&&' 1) #(26 '::' 5) #(26 '< :' 6) #(26 'else' 8) #(26 'elseif' 9) #(26 'end' 10) #(26 'function' 11) #(26 'if' 12) #(26 'module' 13) #(26 'mutable' 14) #(26 'struct' 15) #(26 '||' 17))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
JuliaScanner >> emptySymbolTokenId [
	^ 59
]

{ #category : #generated }
JuliaScanner >> errorTokenId [
	^ 60
]

{ #category : #generated }
JuliaScanner >> scan1 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan2 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan2 [
	self recordMatch: #(25 26).
	self step.
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan3 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $= ifTrue: [ ^ self scan1 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan4 [
	self recordMatch: #(22 26).
	self step.
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForToken [
	self recordMatch: #(26).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scanForTokenX1 ].
	currentCharacter == $(
		ifTrue: [ self recordMatch: #(2 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $)
		ifTrue: [ self recordMatch: #(3 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $,
		ifTrue: [ self recordMatch: #(4 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX2 ].
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(7 25 26).
			self step.
			currentCharacter == $" ifTrue: [ ^ self scan2 ].
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(16 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $}
		ifTrue: [ self recordMatch: #(18 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	(currentCharacter == Character lf or: [ currentCharacter == $; ])
		ifTrue: [ self recordMatch: #(19 26).
			self step ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1 [
	self recordMatch: #(22 25 26 27).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scanForTokenX1X4 ].
	^ self scanForTokenX1X9
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X1 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan4 ].
	currentCharacter == $/ ifTrue: [ ^ self scan3 ].
	currentCharacter == $= ifTrue: [ ^ self scan1 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X2 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan4 ].
	currentCharacter == $= ifTrue: [ ^ self scan1 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X3 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(23 26).
			self step.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $= ifTrue: [ ^ self scan1 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X4 [
	[ self recordMatch: #(22 23 26).
	self step.
	currentCharacter == $" ] whileTrue.
	currentCharacter == $= ifTrue: [ ^ self scan1 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X5 [
	self recordMatch: #(26).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan4 ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X6 [
	self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X7 [
	self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X8 [
	[ self recordMatch: #(26).
	self step.
	true ] whileTrue
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1X9 [
	currentCharacter == $- ifTrue: [ ^ self scanForTokenX1X3 ].
	currentCharacter == $/ ifTrue: [ ^ self scanForTokenX1X1 ].
	currentCharacter == $\ ifTrue: [ ^ self scanForTokenX1X5 ].
	currentCharacter = (Character value: 8901) ifTrue: [ ^ self scanForTokenX1X7 ].
	('=~' includes: currentCharacter) ifTrue: [ ^ self scan1 ].
	(currentCharacter = (Character value: 8592)
		or: [ currentCharacter = (Character value: 8594) ])
		ifTrue: [ ^ self scanForTokenX1X6 ].
	((currentCharacter between: $% and: $&)
		or: [ currentCharacter = (Character value: 247) ])
		ifTrue: [ ^ self scanForTokenX1X2 ].
	('$:^' includes: currentCharacter) ifTrue: [ ^ self scan3 ].
	true ifTrue: [ self scanForTokenX1X8 ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX2 [
	self recordMatch: #(26).
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(21 26).
					self step.
					true
						ifTrue: [ [ self recordMatch: #(26).
							self step.
							true ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter isDigit ] whileTrue.
			true
				ifTrue: [ [ self recordMatch: #(26).
					self step.
					true ] whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(20 26).
					self step.
					true
						ifTrue: [ [ self recordMatch: #(26).
							self step.
							true ] whileTrue ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	true
		ifTrue: [ [ self recordMatch: #(26).
			self step.
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #comment)
]
