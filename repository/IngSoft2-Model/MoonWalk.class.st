Class {
	#name : 'MoonWalk',
	#superclass : 'Cell',
	#instVars : [
		'stepsBack'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
MoonWalk >> applyEffect: aPlayer [
    ^ 0
]

{ #category : 'behavior' }
MoonWalk >> applyEffectFor: aPlayer with: aBoard [
"    | currentIndex newIndex newCell |
	currentIndex := aBoard squares indexOf: (aBoard playersPosition at: aPlayer).
	newIndex := currentIndex - 4.
		[ newIndex <1 ] whileTrue: [
		aPlayer decrementTurn.
		newIndex := newIndex + aBoard squares size ].

	
	newCell:=  aBoard squares at: newIndex.
	aBoard playersPosition at: aPlayer put: newCell."
]

{ #category : 'initialization' }
MoonWalk >> initialize [
	^self
]
