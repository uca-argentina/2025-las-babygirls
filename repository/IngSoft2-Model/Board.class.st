"
Where the game is played. 
"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing - arguments' }
Board >> getNumberOfSquares [

	^ numberOfSquares
]

{ #category : 'initialization' }
Board >> initializeWith: aNumbberOfSquares [

	aNumbberOfSquares < 5 ifTrue: [
		Error signal: 'The board must have at least 5 Squares.' ].

	numberOfSquares := aNumbberOfSquares
]
