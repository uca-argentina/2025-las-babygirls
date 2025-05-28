"
Represents a player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'shields',
		'turns'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Player >> batallarCon: otroJugador usando: dado1 and: dado2 en: board [

	| tiradaSelf tiradaOtro  |
	tiradaSelf := dado1 roll.
	tiradaOtro := dado2 roll.
	
	"[tiradaSelf = tiradaOtro] whileTrue:
	[ tiradaSelf := dado1 roll.
	tiradaOtro := dado2 roll. ]."
	
	(tiradaSelf > tiradaOtro) 
	ifTrue: 
	[ self editShield: -1 .
		board sendToStart: self. ]
	ifFalse: [ otroJugador editShield: -1 .
		board sendToStart: otroJugador. ].
		
	
]

{ #category : 'behavior' }
Player >> decrementTurn [

turns := turns - 1.
]

{ #category : 'behavior' }
Player >> editShield: value [
	shields := shields + value
]

{ #category : 'behavior' }
Player >> incrementTurn [

turns := turns +1.
]

{ #category : 'initialization' }
Player >> initialize [
	shields := 3 .
	turns := 0.
]

{ #category : 'behavior' }
Player >> loseShield [
	shields - 1.
	shields <= 0 ifTrue: [ 
		turns := 2.
		shields := 0].

]

{ #category : 'accessing' }
Player >> shield [
	^shields.
]

{ #category : 'accessing' }
Player >> turns [
	^ turns
]
