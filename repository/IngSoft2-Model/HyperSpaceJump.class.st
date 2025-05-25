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

{ #category : 'behavior' }
HyperSpaceJump >> applyEffect: aPlayer [
	aPlayer editShield: shields.
	^ distance.
]

{ #category : 'initialization' }
HyperSpaceJump >> initialize [
   distance := 4.
	shields := -1 .
   ^self
]
