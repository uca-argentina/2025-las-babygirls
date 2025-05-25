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
		'playersPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Match class >> with: aNumberOfPlayers and: aNumberofSquares and: dice [

^self new initializeWith: aNumberOfPlayers and: aNumberofSquares and: dice.
]

{ #category : 'behavior' }
Match >> applyCellEffectFor: aPlayer at: aPosition [
    | offset |
    "Preguntamos a la celda su offset"
    offset := (theBoard squares at: aPosition) applyEffect: aPlayer .
    "Si hay desplazamiento, Match actualiza la posición"
    offset isNumber
        ifTrue: [ offset = 0
            ifFalse: [ 
                playersPosition 
                    at: aPlayer 
                    put: (aPosition + offset) 
            ]].
]

{ #category : 'behavior' }
Match >> changeNextTurnPlayer [

| nextPlayer index size |
index := players indexOf: nextTurn .
size := players size.
nextPlayer := players at: (index = size ifTrue: [1] ifFalse: [index + 1]).

]

{ #category : 'behavior' }
Match >> checkIfWins: aPlayer [

	| thereIsAWinner |
	thereIsAWinner := false.
	(theBoard wins: (playersPosition at: aPlayer)) ifTrue: [
		theWinner := aPlayer.
		thereIsAWinner := true ].
	^thereIsAWinner.
]

{ #category : 'test methods' }
Match >> getNumberOfPlayers [
	^players size. 
]

{ #category : 'test methods' }
Match >> getPlayer: aNumber [

	^ players at: aNumber
]

{ #category : 'test methods' }
Match >> getPlayerPosition: aNumber [

	^ playersPosition at: (players at: aNumber)
]

{ #category : 'initialization' }
Match >> initializeWith: aNumberOfPlayers and: aNumberOfSquares and: dice [

    theWinner := false.
    theDice   := dice.

    playersPosition := Dictionary new.
    players         := OrderedCollection new.

    1 to: aNumberOfPlayers do: [:i |
        | player |
        player := Player new initialize.
        playersPosition at: player put: 0.
        players add: player
    ].
    theBoard := Board new initializeWith: aNumberOfSquares.
    nextTurn := players first.

]

{ #category : 'behavior' }
Match >> playRound [

	players do: [ :aPlayer |
		(self winner = aPlayer) ifFalse: [ self playTurn: aPlayer ] ]
]

{ #category : 'behavior' }
Match >> playTurn: aPlayer [
    | diceRoll currentPos newPos |
    aPlayer == nextTurn ifFalse: [ ^ self ].

    diceRoll := self rollTheDice.
    currentPos := playersPosition at: aPlayer.
    newPos := currentPos + diceRoll.
    playersPosition at: aPlayer put: newPos.

    self applyCellEffectFor: aPlayer at: newPos.

    self changeNextTurnPlayer.
    ^ self checkIfWins: aPlayer
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
