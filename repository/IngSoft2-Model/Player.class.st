"
Represents a player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'shields',
		'laps',
		'remainingSkippedTurns'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Player >> battleWith: otherPlayer using: die and: die2 in: board [

	| tiradaSelf tiradaOtro  |
	tiradaSelf := die roll.
	tiradaOtro := die2 roll.
	
	[tiradaSelf = tiradaOtro] whileTrue:
	[ tiradaSelf := die roll.
	tiradaOtro := die2 roll. ].
	
	(tiradaSelf > tiradaOtro) 
	ifFalse: 
	[ self loseShield.
		board sendToStart: self. ]
	ifTrue: [ 
		otherPlayer loseShield.
		board sendToStart: otherPlayer.
	 ].
		
	
]

{ #category : 'behavior' }
Player >> decrementLap [

laps := laps - 1.
]

{ #category : 'behavior' }
Player >> decrementTurnToLose [
remainingSkippedTurns := remainingSkippedTurns -1.
]

{ #category : 'behavior' }
Player >> editShield: value [
	shields := value
]

{ #category : 'behavior' }
Player >> incrementLap [

laps := laps +1.
]

{ #category : 'initialization' }
Player >> initialize [
	shields := 3 .
	laps := 0.
	remainingSkippedTurns := 0.
	
]

{ #category : 'accessing' }
Player >> laps [
	^ laps
]

{ #category : 'behavior' }
Player >> loseShield [

	shields := shields - 1.
	shields <= 0 ifFalse: [ ^ self ].
	remainingSkippedTurns := 2.
	shields := 3
]

{ #category : 'accessing' }
Player >> remainingSkippedTurns [

	^ remainingSkippedTurns
]

{ #category : 'accessing' }
Player >> shield [
	^shields.
]
