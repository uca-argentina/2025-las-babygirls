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
		'theWinner'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Match class >> with: aNumberOfPlayers and: aNumberofSquares [

^self new initializeWith: aNumberOfPlayers and: aNumberofSquares 
]

{ #category : 'adding' }
Match >> addDie: aNumberOfSquares [ 
	theDice add: (Die withSides: aNumberOfSquares).
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

{ #category : 'getter' }
Match >> getNumberOfPlayers [
	^players size. 
]

{ #category : 'getter' }
Match >> getNumberOfSquares [
	^theBoard getNumberOfSquares.
]

{ #category : 'getter' }
Match >> getPlayer: aNumber [

	^ players at: aNumber
]

{ #category : 'getter' }
Match >> getWinner [

	^ theWinner
]

{ #category : 'initialization' }
Match >> initializeWith: aNumberOfPlayers and: aNumberofSquares [

	theWinner:= 'There is not a winner yet.'.
	theDice := OrderedCollection new.
	players := OrderedCollection new.
	1 to: aNumberOfPlayers do: [ :i | players add: Player new ].
	theBoard := Board new initializeWith: aNumberofSquares
]

{ #category : 'behavior' }
Match >> playRound [

	players do: [ :aPlayer |
		self playTurn: aPlayer.
		(self checkIfWins: aPlayer) ifTrue: [ ^ self ] ]
]

{ #category : 'behavior' }
Match >> playTurn: aPlayer [ 
		| aNumber |
		aNumber := self rollTheDice.
		aPlayer moveXSquaresAhead: aNumber.
		^self checkIfWins: aPlayer
		
]

{ #category : 'behavior' }
Match >> rollTheDice [

	| total |
	total := 0.
	theDice do: [ :die | total := total + die roll ].
	^total
]
