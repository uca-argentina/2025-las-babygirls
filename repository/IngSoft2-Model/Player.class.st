"
Represents a player.
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'shields',
		'laps',
		'remainingSkippedTurns',
		'cards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Player >> cards [
	^ cards
]

{ #category : 'behavior race' }
Player >> decrementLap [

laps := laps - 1.
]

{ #category : 'behavior race' }
Player >> decrementSkippedTurns [

	remainingSkippedTurns:= remainingSkippedTurns - 1
]

{ #category : 'behavior race' }
Player >> incrementLap [

laps := laps +1.
]

{ #category : 'initialization' }
Player >> initialize [
	shields := 3 .
	laps := 0.
	remainingSkippedTurns := 0.
	
	cards := OrderedCollection new .
	

]

{ #category : 'behavior race' }
Player >> isSkippingTurn [

^(remainingSkippedTurns > 0)
]

{ #category : 'accessing' }
Player >> laps [
	^ laps
]

{ #category : 'behavior race' }
Player >> loseShield [

	shields := shields - 1.
	shields <= 0 ifFalse: [ ^ self ].
	remainingSkippedTurns := 2.
	shields := 3
]

{ #category : 'behavior - cards' }
Player >> receiveCard: aCard [
    
    cards add: aCard.

]

{ #category : 'behavior race' }
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

{ #category : 'behavior - cards' }
Player >> useCard: aCardIndex with: aMatch [
    | selectedCard |

    (aCardIndex isInteger and: [ aCardIndex > 0 and: [ aCardIndex <= cards size ] ]) ifFalse: [
        Error signal: 'Invalid card index: ', aCardIndex printString
    ].

    selectedCard := cards at: aCardIndex.
    aMatch activateCard: selectedCard.
    cards removeAt: aCardIndex.

]
