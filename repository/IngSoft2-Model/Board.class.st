<<<<<<< HEAD

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

{ #category : 'behavior' }
Board >> wins: aSquare [

	| mesagge |
	mesagge := false.
	((aSquare = numberOfSquares) or: (aSquare > numberOfSquares)) ifTrue: [ mesagge := true ].
	^ mesagge
]
=======
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
>>>>>>> parent of 6a5e605 (Feature/creation of match (#13))
