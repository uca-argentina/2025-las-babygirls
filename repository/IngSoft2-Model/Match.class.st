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
		'playersPosition',
		'aWinner'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Match class >> mockedWith: aNumberOfPlayers and: dice [

^self new initializeMockedWith: aNumberOfPlayers and: dice.
]

{ #category : 'initialization' }
Match class >> with: aNumberOfPlayers and: aNumberofSquares and: dice [

^self new initializeWith: aNumberOfPlayers and: aNumberofSquares and: dice.
]

{ #category : 'behavior' }
Match >> applyCellEffectFor: aPlayer at: aPosition [
    "| offset |

    offset := aPosition applyEffect: aPlayer .
    offset isNumber
        ifTrue: [ offset = 0
            ifFalse: [ 
                playersPosition 
                    at: aPlayer 
                    put: (aPosition + offset) 
            ]]."
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

	(theBoard wins: (aPlayer turns)) ifTrue: [
		theWinner := aPlayer.
		aWinner := true ].
	^aWinner.
]

{ #category : 'initialization' }
Match >> initializeMockedWith: aNumberOfPlayers and: dice [

    theWinner := false.
    aWinner := false.
    theDice   := dice.
    theBoard := MockedBoard new initialize.

    playersPosition := Dictionary new.
    players         := OrderedCollection new.

    1 to: aNumberOfPlayers do: [:i |
        | player |
        player := Player new initialize.
        playersPosition at: player put: theBoard firstCell.
        players add: player
    ].

    nextTurn := players first.
^ self
]

{ #category : 'initialization' }
Match >> initializeWith: aNumberOfPlayers and: aNumberOfSquares and: dice [

    theWinner := false.
    aWinner := false.
    theDice   := dice.
    theBoard := Board new initializeWith: aNumberOfSquares.

    playersPosition := Dictionary new.
    players         := OrderedCollection new.

    1 to: aNumberOfPlayers do: [:i |
        | player |
        player := Player new initialize.
        playersPosition at: player put: theBoard firstCell.
        players add: player
    ].

    nextTurn := players first.
^ self
]

{ #category : 'behavior' }
Match >> playRound [

	players do: [ :aPlayer |
		(aWinner) ifFalse: [ self playTurn: aPlayer ] ]
]

{ #category : 'behavior' }
Match >> playTurn: aPlayer [
    | diceRoll currentPos newPos |
    aPlayer == nextTurn ifFalse: [ ^ self ].

    diceRoll := self rollTheDice.
    currentPos := playersPosition at: aPlayer.
	 newPos := theBoard goAhead: diceRoll with: aPlayer in: currentPos.
    playersPosition at: aPlayer put: newPos.

    self applyCellEffectFor: aPlayer at: newPos.

    self changeNextTurnPlayer.
    ^ self checkIfWins: aPlayer
]

{ #category : 'test methods' }
Match >> player: aNumber [

	^ players at: aNumber
]

{ #category : 'test methods' }
Match >> playerPosition: aNumber [

	^ playersPosition at: (players at: aNumber)
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
