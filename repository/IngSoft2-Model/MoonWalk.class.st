"
Vuelve a todas las demás naves N casilleros hacia atrás. 
No afecta al que cayó en el casillero. 
El número de casilleros N varía por cada casillero, es decir puede haber 
casilleros con distinto N en el mismo tablero. 
"
Class {
	#name : 'MoonWalk',
	#superclass : 'Normal',
	#instVars : [
		'distance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
MoonWalk >> applyEffectTo: aPlayer on: aBoard [
    | otherPlayers |
    otherPlayers := aBoard playersPositions keys reject: [:each | each = aPlayer ].

    otherPlayers do: [:otherPlayer |
        aBoard move: otherPlayer toRelativePosition: distance.
    ].

]

{ #category : 'initialization' }
MoonWalk >> initializeWith: aDistance [
	distance:= aDistance negated.
]
