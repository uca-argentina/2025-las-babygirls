"
Una casilla que retrocede un jugador 4 casilleros.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Normal',
	#instVars : [
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
BlackHole >> applyEffectTo: aPlayer on: aBoard [
    aBoard move: aPlayer toRelativePosition: distance.

				
				
]

{ #category : 'initialization' }
BlackHole >> initialize [ 
	distance:= -4.
]
