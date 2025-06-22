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
Player >> decrementLap [

laps := laps - 1.
]

{ #category : 'behavior' }
Player >> decrementSkippedTurns [

	remainingSkippedTurns:= remainingSkippedTurns - 1
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

{ #category : 'behavior' }
Player >> isSkippingTurn [

^(remainingSkippedTurns > 0)
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

{ #category : 'behavior' }
Player >> recoverShields [

shields := 3.
]

{ #category : 'accessing' }
Player >> remainingSkippedTurns [

	^ remainingSkippedTurns
]

{ #category : 'accessing' }
Player >> shield [
	^shields.
]
