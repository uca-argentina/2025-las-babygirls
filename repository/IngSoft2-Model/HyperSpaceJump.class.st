"
Avanza Al jugador para adelante y le quita un escudo.
"
Class {
	#name : 'HyperSpaceJump',
	#superclass : 'Cell',
	#instVars : [
		'distance',
		'shields'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
HyperSpaceJump >> applyEffectFor: aPlayer with: aBoard [
   | currentIndex newIndex newCell |
	aPlayer editShield: shields.
	currentIndex := aBoard squares indexOf: (aBoard playersPosition at: aPlayer).
	newIndex := currentIndex + distance.
		[ newIndex > aBoard squares size ] whileTrue: [
		aPlayer incrementTurn.
		newIndex := newIndex - aBoard squares size ].

	
	newCell:=  aBoard squares at: newIndex.
	aBoard playersPosition at: aPlayer put: newCell.
]

{ #category : 'initialization' }
HyperSpaceJump >> initialize [
 	distance := 4.
   shields := -1.
   ^ self.


]
