"
Dado con el que se jugará al juego.
"
Class {
	#name : 'DieFake',
	#superclass : 'Object',
	#instVars : [
		'sides'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
DieFake class >> withSides: aNumber [

	aNumber < 2 ifTrue: [
		Error signal: 'The sides of the dice must be at least 2' ].
	^ self new initializzeWithSize: aNumber.
]

{ #category : 'initialize' }
DieFake >> initializzeWithSize: aNumber [

sides := aNumber.
]

{ #category : 'behavior' }
DieFake >> roll [

	^ sides
]
