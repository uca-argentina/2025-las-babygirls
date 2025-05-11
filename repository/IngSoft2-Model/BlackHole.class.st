"
Creates a Black Hole on the Board
"
Class {
	#name : 'BlackHole',
	#superclass : 'Object',
	#instVars : [
		'portal1',
		'portal2'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'getter' }
BlackHole >> getPortal1 [

	^ portal1 .
]

{ #category : 'getter' }
BlackHole >> getPortal2 [

	^ portal2 .
]

{ #category : 'initialization' }
BlackHole >> initialize: aBoardSize [

	portal1 := (1 to: aBoardSize ) atRandom .
	portal2 := (1 to: aBoardSize ) atRandom .
	[portal1 = portal2] whileTrue: [ portal2 := (1 to: aBoardSize ) atRandom] .
]
