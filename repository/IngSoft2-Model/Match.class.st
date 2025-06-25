"
In charge of knowing how the game evolves.
"
Class {
	#name : 'Match',
	#superclass : 'Object',
	#instVars : [
		'players',
		'theBoard',
		'theDice',
		'theWinner',
		'nextTurn',
		'croupier'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Match class >> withPlayers: somePlayers board: aBoard dice: aDice [

^self new initializeWithPlayers: somePlayers board: aBoard dice: aDice.
]

{ #category : 'behavior' }
Match >> activateCard: selectedCard to: aPlayer [

	croupier activateCard: selectedCard to: aPlayer.
]

{ #category : 'initialization' }
Match >> board [

	^ theBoard 
]

{ #category : 'behavior' }
Match >> changeNextTurnPlayer [
    | index size |
    index := players indexOf: nextTurn.
    size  := players size.
    nextTurn := players at: (index = size
        ifTrue:  [ 1 ]
        ifFalse: [ index + 1 ]).


]

{ #category : 'behavior' }
Match >> checkIfWins: aPlayer [

	 | aWinner |
	aWinner := false.
	(theBoard wins: (aPlayer laps)) ifTrue: [
		theWinner := aPlayer.
		aWinner := true ].
	^aWinner.
]

{ #category : 'initialization' }
Match >> initializeWithPlayers: somePlayers board: aBoard dice: aDice [
    theWinner := false.
    theDice := aDice.
    players := somePlayers.
    theBoard := aBoard.
    nextTurn := players first.
	 croupier := Croupier new.
	 croupier giveInitialCardsTo: players .
    ^ self

]

{ #category : 'behavior' }
Match >> playRound [

	players do: [ :aPlayer |
		(theWinner == false) ifTrue: [ self playTurn: aPlayer ] ]
]

{ #category : 'behavior' }
Match >> playTurn: aPlayer [
    | diceRoll extraMovement |
    aPlayer == nextTurn ifFalse: [ ^ self ].

    diceRoll := self rollTheDice.
	 extraMovement := croupier changeTotalRollTo: aPlayer .
	 diceRoll := diceRoll + extraMovement.
	theBoard playTurnWith: aPlayer and: diceRoll.

    self changeNextTurnPlayer.
    self checkIfWins: aPlayer.
]

{ #category : 'test methods' }
Match >> player: aNumber [

	^ players at: aNumber
]

{ #category : 'behavior' }
Match >> player: aPlayerIndex useCard: cardIndex toPlayer: targetPlayerIndex [
    | player targetPlayer cardToUse|

    player := self player: aPlayerIndex.
	 cardToUse := player card: cardIndex.
    targetPlayer := self player: targetPlayerIndex.
    (player = nextTurn)
        ifFalse: [ self error: 'It is not your turn to play a card.' ].
    self activateCard: cardToUse to: targetPlayer.


]

{ #category : 'test methods' }
Match >> playerCards: numberOfPlayer [ 
	^(self player: numberOfPlayer) cards.
]

{ #category : 'test methods' }
Match >> playerTurn: aNumber [ 
	^(players at: aNumber) laps
]

{ #category : 'behavior' }
Match >> podium [
	| orderedPlayers |

	orderedPlayers := players sort: [ :a :b |
		a laps > b laps
	].

	^ (orderedPlayers first: (orderedPlayers size min: 3)) asArray


]

{ #category : 'test methods' }
Match >> positionOfPlayer: aNumber [
    | player |
    player := players at: aNumber.
    ^ theBoard positionOfPlayer: player.

]

{ #category : 'behavior' }
Match >> rollTheDice [

	| total |
	total := 0.
	theDice do: [ :die | total := total + die roll ].
	^total
]

{ #category : 'getter' }
Match >> winner [

	^ theWinner
]
