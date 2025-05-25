"
Where the game is played. 
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'boardSize',
		'boardSquares'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Board >> initializeWith: aNumberOfSquares [

    | numNoEffect numBlackHole numHyperSpaceJump numMoonWalk numHyperJump numAtomicBomb
      remainder parsecList parsecIndex squares |

	aNumberOfSquares < 10 ifTrue: [
		Error signal: 'The board must have at least 10 Squares.' ].

    numNoEffect := (aNumberOfSquares * 40) // 100.
    numBlackHole := (aNumberOfSquares * 20) // 100.
    numHyperSpaceJump := (aNumberOfSquares * 20) // 100.
    numMoonWalk := (aNumberOfSquares * 10) // 100.
    numHyperJump := (aNumberOfSquares * 8)  // 100.
    numAtomicBomb := (aNumberOfSquares * 2)  // 100.
    remainder := aNumberOfSquares - ( numNoEffect + numBlackHole + numHyperSpaceJump + numMoonWalk + numHyperJump + numAtomicBomb ).
    numNoEffect := numNoEffect + remainder.

    parsecList := #(20 15 10 5).
    parsecIndex := 1.

    squares := OrderedCollection new.
    
    numNoEffect timesRepeat: [
        squares add: (Cell new initialize) ].
    numBlackHole timesRepeat: [
        squares add: (BlackHole new initialize) ].
    numHyperSpaceJump timesRepeat: [
        squares add: (HyperSpaceJump new initialize) ].
    numMoonWalk timesRepeat: [
        squares add: (MoonWalk new initialize) ].
    numAtomicBomb timesRepeat: [
        squares add: (AtomicBomb new initialize) ].
    numHyperJump timesRepeat: [
        squares add: (HyperJump new initialize) ].

    squares := (squares asArray shuffle) asOrderedCollection.

    boardSize      := aNumberOfSquares.
    boardSquares   := squares.
    ^ self

]

{ #category : 'accessing - arguments' }
Board >> numberOfSquares [

	^ numberOfSquares
]

{ #category : 'test methods' }
Board >> squares [ 
	^ boardSquares .
]

{ #category : 'behavior' }
Board >> wins: aSquare [
    ^ (aSquare = boardSize)
        or: [ aSquare > boardSize ].
]
