"
Dado con el que se jugará al juego.
"
Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'sides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Dice >> initializeWithSides: aNumber [

	aNumber < 2 ifTrue: [
		Error signal: 'The sides of the dice must be at least 2' ].
	sides := aNumber
]

{ #category : 'behavior' }
Dice >> roll [

	^ (1 to: sides) atRandom
]
