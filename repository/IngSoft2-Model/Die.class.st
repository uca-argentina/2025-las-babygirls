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

{ #category : 'as yet unclassified' }
Die class >> withSides: aSides [ 
		aSides < 2 ifTrue: [Error signal: 'The sides of the dice must be at least 2'].
	^ self new initializeWithSides: aSides.
]

{ #category : 'initialization' }
Die >> initializeWithSides: aNumber [ 
	
	sides := aNumber.
]

{ #category : 'behavior' }
Die >> roll [
    ^ (1 to: sides) atRandom

]
