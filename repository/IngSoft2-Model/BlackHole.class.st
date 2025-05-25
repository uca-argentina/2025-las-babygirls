"
Una casilla que retrocede un jugador 4 casilleros.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Cell',
	#instVars : [
		'oneEnd',
		'otherEnd'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
BlackHole >> applyEffect: aPlayer [
    ^ -4
]

{ #category : 'initialization' }
BlackHole >> initialize [ 
	^self
]
