Class {
	#name : 'MoonWalk',
	#superclass : 'Cell',
	#instVars : [
		'stepsBack',
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
MoonWalk >> applyEffectFor: aPlayer with: aBoard [

    aBoard playersPosition keysDo: [ :otherPlayer |
    otherPlayer = aPlayer ifFalse: [
    	| currentIndex newIndex newCell |
    	currentIndex := aBoard squares indexOf: (aBoard playersPosition at: otherPlayer).
		newIndex := currentIndex + distance.
				[newIndex < 1 ] whileTrue: [
				otherPlayer decrementTurn.
				newIndex := newIndex + aBoard squares size ].
       newCell := aBoard squares at: newIndex.
       aBoard playersPosition at: otherPlayer put: newCell
        ]].

]

{ #category : 'initialization' }
MoonWalk >> initialize [
	^self.
]

{ #category : 'initialization' }
MoonWalk >> initializeWith: aDistance [
	distance:= aDistance negated.
	^self
]
