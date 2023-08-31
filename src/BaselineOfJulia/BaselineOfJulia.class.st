Class {
	#name : #BaselineOfJulia,
	#superclass : #BaselineOf,
	#category : #BaselineOfJulia
}

{ #category : #baseline }
BaselineOfJulia >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4Julia'
		]
]
