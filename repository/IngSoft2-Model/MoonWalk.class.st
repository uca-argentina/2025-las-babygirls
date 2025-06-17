"
Vuelve a todas las demás naves N casilleros hacia atrás. 
No afecta al que cayó en el casillero. 
El número de casilleros N varía por cada casillero, es decir puede haber 
casilleros con distinto N en el mismo tablero. 
"
Class {
	#name : 'MoonWalk',
	#superclass : 'Cell',
	#instVars : [
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
				otherPlayer decrementLap.
				newIndex := newIndex + aBoard squares size ].
       newCell := aBoard squares at: newIndex.
       aBoard playersPosition at: otherPlayer put: newCell.

		
        ]
].
	self fightIn: aBoard with: aPlayer in: self.		
]

{ #category : 'initialization' }
MoonWalk >> initializeWith: aDistance [
	distance:= aDistance negated.
]
