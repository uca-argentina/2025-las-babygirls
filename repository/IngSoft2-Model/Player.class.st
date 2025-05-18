"
Represents a player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'myPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Player >> initialize [

	myPosition := 0
]

{ #category : 'modifier state' }
Player >> moveAhead: aNuumberOfSquares [

	myPosition := myPosition + aNuumberOfSquares
]

{ #category : 'initialization' }
Player >> setPosition: aSquare [

	myPosition := aSquare
]

{ #category : 'accessing - attributes' }
Player >> showYourPosition [

	^ myPosition
]
