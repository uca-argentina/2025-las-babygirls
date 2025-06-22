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
BlackHole >> applyEffectTo: aPlayer on: aBoard [
   | currentIndex newIndex newCell |
	currentIndex := aBoard squares indexOf: (aBoard playersPositions at: aPlayer).
	newIndex := currentIndex + distance.
		[ newIndex < 1 ] whileTrue: [
		aPlayer decrementLap.
		newIndex := newIndex + aBoard squares size ].

	
	newCell:=  aBoard squares at: newIndex.
	aBoard playersPositions at: aPlayer put: newCell.
	
	self fightIn: aBoard with: aPlayer in: newCell
				
				
]

{ #category : 'initialization' }
BlackHole >> initialize [ 
	distance:= -4.
]
