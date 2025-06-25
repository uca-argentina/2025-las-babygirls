"
Dado con el que se jugará al juego.
"
Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'sides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Die class >> withSides: aNumber [

	aNumber < 2 ifTrue: [
		Error signal: 'The sides of the dice must be at least 2' ].
	^ self new initializeWithSize: aNumber.
]

{ #category : 'initialize' }
Die >> initializeWithSize: aNumber [

sides := aNumber.
]

{ #category : 'behavior' }
Die >> roll [

	^ (1 to: sides) atRandom
]
