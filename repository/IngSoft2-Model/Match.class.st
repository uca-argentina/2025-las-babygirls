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
		'nextTurn'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Match class >> with: aNumberOfPlayers and: aNumberofSquares and: dice [

^self new initializeWith: aNumberOfPlayers and: aNumberofSquares and: dice.
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
	(theBoard wins: aPlayer showYourPosition) ifTrue: [
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

{ #category : 'initialization' }
Match >> initializeWith: aNumberOfPlayers and: aNumberofSquares and: dice [

	theWinner:= false.
	theDice := dice.
	players := OrderedCollection new.
	1 to: aNumberOfPlayers do: [ :i | players add: Player new ].
	theBoard := Board new initializeWith: aNumberofSquares.
	nextTurn := players first.
]

{ #category : 'test methods' }
Match >> numberOfSquares [
	^theBoard numberOfSquares.
]

{ #category : 'behavior' }
Match >> playRound [

	players do: [ :aPlayer |
		(self winner = aPlayer) ifFalse: [ self playTurn: aPlayer ] ]
]

{ #category : 'behavior' }
Match >> playTurn: aPlayer [

	| aNumber |
	aPlayer == nextTurn ifFalse: [ ^ self ].
	aNumber := self rollTheDice.
	aPlayer moveAhead: aNumber.
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
