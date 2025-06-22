"
Avanza la nave 4 casilleros. 
Pierde 1 escudo 
"
Class {
	#name : 'HyperSpaceJump',
	#superclass : 'Cell',
	#instVars : [
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
HyperSpaceJump >> applyEffectTo: aPlayer on: aBoard [
   | currentIndex newIndex newCell |
	aPlayer loseShield .
	currentIndex := aBoard squares indexOf: (aBoard playersPositions at: aPlayer).
	newIndex := currentIndex + distance.
		[ newIndex > aBoard squares size ] whileTrue: [
		aPlayer incrementLap.
		newIndex := newIndex - aBoard squares size ].

	
	newCell:=  aBoard squares at: newIndex.
	aBoard playersPositions at: aPlayer put: newCell.
	self fightIn: aBoard with: aPlayer in: newCell
]

{ #category : 'initialization' }
HyperSpaceJump >> initialize [
 	distance := 4.


]
