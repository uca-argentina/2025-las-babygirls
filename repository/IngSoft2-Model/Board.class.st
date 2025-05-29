"
Where the game is played. 
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'boardSize',
		'boardSquares',
		'playersPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Board >> battleBetween: player1 and: player2 [
	| dado1 dado2 |
	dado1:= Die withSides: 6.
	dado2:= Die withSides: 6.
	(player1) battleWith: (player2) using:dado1 and: dado2 in: self.
	
	
]

{ #category : 'accessing - arguments' }
Board >> firstCell [

^boardSquares first.
]

{ #category : 'initialization' }
Board >> initializeWith: aNumberOfSquares and: players [

	| numNoEffect numBlackHole numHyperSpaceJump numMoonWalk numHyperJump numAtomicBomb remainder squares |
	aNumberOfSquares < 10 ifTrue: [
		Error signal: 'The board must have at least 10 Squares.' ].

	numNoEffect := aNumberOfSquares * 40 // 100.
	numBlackHole := aNumberOfSquares * 20 // 100.
	numHyperSpaceJump := aNumberOfSquares * 20 // 100.
	numMoonWalk := aNumberOfSquares * 10 // 100.
	numHyperJump := aNumberOfSquares * 8 // 100.
	numAtomicBomb := aNumberOfSquares * 2 // 100.
	remainder := aNumberOfSquares
	             -
		             (numNoEffect + numBlackHole + numHyperSpaceJump
		              + numMoonWalk + numHyperJump + numAtomicBomb).
	numNoEffect := numNoEffect + remainder.




	squares := OrderedCollection new.

	numNoEffect timesRepeat: [ squares add: Normal new initialize ].
	numBlackHole timesRepeat: [ squares add: BlackHole new initialize ].
	numHyperSpaceJump timesRepeat: [
		squares add: HyperSpaceJump new initialize ].
	numMoonWalk timesRepeat: [
		squares add:
			(MoonWalk new initializeWith: (1 to: squares size) atRandom) ].
	numAtomicBomb timesRepeat: [ squares add: AtomicBomb new initialize ].
	numHyperJump timesRepeat: [ squares add: HyperJump new initialize ].

	squares := squares asArray shuffle asOrderedCollection.


	boardSize := aNumberOfSquares.
	boardSquares := squares.
	playersPosition := Dictionary new.

	players do: [ :player |
		playersPosition at: player put: boardSquares first ]
]

{ #category : 'accessing - arguments' }
Board >> numberOfSquares [

	^ numberOfSquares
]

{ #category : 'behavior' }
Board >> playTurnWith: aPlayer and: diceRoll [

	| currentIndex newIndex newCell ocupantes |
	aPlayer turnsToLose > 0 ifTrue: [
		aPlayer editShield: 3.
		aPlayer decrementTurnToLose.
		^ self ].
	currentIndex := boardSquares indexOf: (playersPosition at: aPlayer).
	newIndex := currentIndex + diceRoll.

	[ newIndex > boardSquares size ] whileTrue: [
		aPlayer incrementLap.
		newIndex := newIndex - boardSquares size ].

	newCell := boardSquares at: newIndex.

	ocupantes := playersPosition keys select: [ :jugador |
		             (playersPosition at: jugador) = newCell and: [
			             jugador ~= aPlayer ] ].

	playersPosition at: aPlayer put: newCell.


	(ocupantes isNotEmpty and: newCell class = Normal)
		ifTrue: [ self battleBetween: aPlayer and: ocupantes first ]
		ifFalse: [ newCell applyEffectFor: aPlayer with: self ]
]

{ #category : 'test methods' }
Board >> playersPosition [ 
	^ playersPosition .
]

{ #category : 'behavior' }
Board >> sendToStart: aPlayer [
	playersPosition at: aPlayer put: boardSquares first.
]

{ #category : 'test methods' }
Board >> squares [ 
	^ boardSquares .
]

{ #category : 'behavior' }
Board >> wins: turns [
    ^ (turns = 3)
        or: [ turns > 3 ].
]
