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

{ #category : 'accessing - arguments' }
Board >> firstCell [

^boardSquares first.
]

{ #category : 'behavior' }
Board >> goAhead: aNumber with: aPlayer in: aCell [

	| indexOfSquare newIndex newCell |
	indexOfSquare := boardSquares indexOf: aCell.

	newIndex := indexOfSquare + aNumber.
	
	[ newIndex > boardSquares size ] whileTrue: [
		aPlayer incrementTurn.
		newIndex := newIndex - boardSquares size ].


	newCell := boardSquares at: newIndex.
	^ newCell
]

{ #category : 'initialization' }
Board >> initializeWith: aNumberOfSquares and: players [

	| numNoEffect numBlackHole numHyperSpaceJump numMoonWalk numHyperJump numAtomicBomb remainder parsecList parsecIndex squares |
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

	parsecList := #( 20 15 10 5 ).
	parsecIndex := 1.

	squares := OrderedCollection new.

	numNoEffect timesRepeat: [ squares add: Normal new initialize ].
	numBlackHole timesRepeat: [ squares add: BlackHole new initialize ].
	numHyperSpaceJump timesRepeat: [
		squares add: HyperSpaceJump new initialize ].
	numMoonWalk timesRepeat: [ squares add: MoonWalk new initialize ].
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

	| currentIndex newIndex newCell |
	currentIndex := boardSquares indexOf: (playersPosition at: aPlayer).
	newIndex := currentIndex + (diceRoll).

	[ newIndex > boardSquares size ] whileTrue: [
		aPlayer incrementTurn.
		newIndex := newIndex - boardSquares size ].

	newCell := boardSquares at: newIndex.
	playersPosition at: aPlayer put: newCell.
	Transcript show: newCell class name; cr.
	
	newCell applyEffectFor: aPlayer with: self.
]

{ #category : 'test methods' }
Board >> playersPosition [ 
	^ playersPosition .
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
