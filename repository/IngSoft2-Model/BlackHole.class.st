"
Una casilla que retrocede un jugador 4 casilleros.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Cell',
	#instVars : [
		'oneEnd',
		'otherEnd',
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
BlackHole >> applyEffectFor: aPlayer with: aBoard [
   | currentIndex newIndex newCell |
	currentIndex := aBoard squares indexOf: (aBoard playersPosition at: aPlayer).
	newIndex := currentIndex + distance.
		[ newIndex < 1 ] whileTrue: [
		aPlayer decrementTurn.
		newIndex := newIndex + aBoard squares size ].

	
	newCell:=  aBoard squares at: newIndex.
	aBoard playersPosition at: aPlayer put: newCell.
]

{ #category : 'intialization' }
BlackHole >> initialize [ 
	distance:= -4.
	^self.
]
