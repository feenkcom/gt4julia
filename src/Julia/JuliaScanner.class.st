Class {
	#name : #JuliaScanner,
	#superclass : #SmaCCScanner,
	#category : #Julia
}

{ #category : #'generated-initialization' }
JuliaScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(25 '&&' 1) #(25 '::' 5) #(25 '< :' 6) #(25 'else' 8) #(25 'elseif' 9) #(25 'end' 10) #(25 'function' 11) #(25 'if' 12) #(25 'module' 13) #(25 'mutable' 14) #(25 'struct' 15) #(25 '||' 17))
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
	self recordMatch: #(19 22 24 25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan1X4 ].
	^ self scan1X9
]

{ #category : #generated }
JuliaScanner >> scan1X1 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	currentCharacter == $/ ifTrue: [ ^ self scan4 ].
	currentCharacter == $= ifTrue: [ ^ self scan2 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X2 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	currentCharacter == $= ifTrue: [ ^ self scan2 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X3 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $"
		ifTrue: [ self recordMatch: #(20 25).
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $= ifTrue: [ ^ self scan2 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X4 [
	[ self recordMatch: #(19 20 25).
	self step.
	currentCharacter == $" ] whileTrue.
	currentCharacter == $= ifTrue: [ ^ self scan2 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X5 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan5 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X6 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue
]

{ #category : #generated }
JuliaScanner >> scan1X7 [
	self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X8 [
	self step.
	currentCharacter == $" ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan1X9 [
	currentCharacter == $- ifTrue: [ ^ self scan1X3 ].
	currentCharacter == $/ ifTrue: [ ^ self scan1X1 ].
	currentCharacter == $\ ifTrue: [ ^ self scan1X5 ].
	currentCharacter = (Character value: 8901) ifTrue: [ ^ self scan1X8 ].
	('=~' includes: currentCharacter) ifTrue: [ ^ self scan2 ].
	(currentCharacter = (Character value: 8592)
		or: [ currentCharacter = (Character value: 8594) ]) ifTrue: [ ^ self scan1X7 ].
	((currentCharacter between: $% and: $&)
		or: [ currentCharacter = (Character value: 247) ]) ifTrue: [ ^ self scan1X2 ].
	('$:^' includes: currentCharacter) ifTrue: [ ^ self scan4 ].
	true ifTrue: [ self scan1X6 ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan2 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan3 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan3 [
	self recordMatch: #(22 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan4 [
	self recordMatch: #(25).
	self step.
	currentCharacter == $= ifTrue: [ ^ self scan2 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan5 [
	self recordMatch: #(19 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scan6 [
	self recordMatch: #(25).
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(25 27).
					self step.
					(currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ])
						ifTrue: [ [ self recordMatch: #(25).
							self step.
							currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage)
										or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter isDigit ] whileTrue.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ [ self recordMatch: #(25).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
			^ self reportLastMatch ].
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(25 26).
					self step.
					(currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage)
								or: [ currentCharacter >= (Character value: 14) ] ])
						ifTrue: [ [ self recordMatch: #(25).
							self step.
							currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage)
										or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
					^ self reportLastMatch ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForToken [
	self recordMatch: #(25).
	self step.
	currentCharacter == Character lf ifTrue: [ ^ self scanForTokenX9 ].
	currentCharacter == Character cr ifTrue: [ ^ self scanForTokenX11 ].
	currentCharacter == $" ifTrue: [ ^ self scan1 ].
	currentCharacter == $( ifTrue: [ ^ self scanForTokenX7 ].
	^ self scanForTokenX12
]

{ #category : #generated }
JuliaScanner >> scanForTokenX1 [
	self recordMatch: #(7 22 25).
	self step.
	currentCharacter == $" ifTrue: [ ^ self scan3 ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX10 [
	[ self recordMatch: #(23).
	self step.
	currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX11 [
	[ self recordMatch: #(23).
	self step.
	currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX12 [
	currentCharacter == $) ifTrue: [ ^ self scanForTokenX6 ].
	currentCharacter == $, ifTrue: [ ^ self scanForTokenX5 ].
	currentCharacter == $/ ifTrue: [ ^ self scan6 ].
	currentCharacter == $; ifTrue: [ ^ self scanForTokenX4 ].
	currentCharacter == $= ifTrue: [ ^ self scanForTokenX1 ].
	currentCharacter == ${ ifTrue: [ ^ self scanForTokenX3 ].
	currentCharacter == $} ifTrue: [ ^ self scanForTokenX2 ].
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(23 25).
			self step.
			(currentCharacter == Character lf or: [ currentCharacter == Character cr ])
				ifTrue: [ ^ self scanForTokenX10 ].
			currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
				whileTrue ].
	true ifTrue: [ self scanForTokenX8 ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX2 [
	self recordMatch: #(18 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX3 [
	self recordMatch: #(16 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX4 [
	self recordMatch: #(25 28).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX5 [
	self recordMatch: #(4 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX6 [
	self recordMatch: #(3 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX7 [
	self recordMatch: #(2 25).
	self step.
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ])
		ifTrue: [ [ self recordMatch: #(25).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> scanForTokenX8 [
	[ self recordMatch: #(25).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage)
				or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue
]

{ #category : #generated }
JuliaScanner >> scanForTokenX9 [
	self recordMatch: #(23 28).
	self step.
	(currentCharacter isSeparator or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter isSeparator or: [ currentCharacter == Character pageUp ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
JuliaScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #whitespace nil #comment)
]
