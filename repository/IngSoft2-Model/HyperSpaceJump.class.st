"
Avanza la nave 4 casilleros. 
Pierde 1 escudo 
"
Class {
	#name : 'HyperSpaceJump',
	#superclass : 'Normal',
	#instVars : [
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
HyperSpaceJump >> applyEffectTo: aPlayer on: aBoard [
    aPlayer loseShield.
    aBoard move: aPlayer toRelativePosition: distance.

]

{ #category : 'initialization' }
HyperSpaceJump >> initialize [
 	distance := 4.


]
