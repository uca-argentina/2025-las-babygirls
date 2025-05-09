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
	sides := aNumber.
]

{ #category : 'behavior' }
Dice >> roll [
    ^ (1 to: sides) atRandom

]
