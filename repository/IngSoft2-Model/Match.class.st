"
In charge of knowing how the game evolves.
"
Class {
	#name : 'Match',
	#superclass : 'Object',
	#instVars : [
		'players',
		'theBoard',
		'theDice'
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

{ #category : 'getter' }
Match >> getNumberOfPlayers [
	^players size. 
]

{ #category : 'accessing - arguments' }
Match >> getNumberOfSquares [
	^theBoard getNumberOfSquares.
]

{ #category : 'initialization' }
Match >> initializeWith: aNumberOfPlayers and: aNumberofSquares [
	theDice := OrderedCollection new.
	players := OrderedCollection new.
	1 to: aNumberOfPlayers do: [ :i | players add: Player new ].
	theBoard := Board new initializeWith: aNumberofSquares
]

{ #category : 'behavior' }
Match >> rollTheDice [

	| total |
	total := 0.
	theDice do: [ :die | total := total + die roll ].
	^total
]
