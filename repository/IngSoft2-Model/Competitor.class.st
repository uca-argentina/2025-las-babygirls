"
Represents a player
"
Class {
	#name : 'Competitor',
	#superclass : 'Object',
	#instVars : [
		'myPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Competitor >> initialize [

	myPosition := 0
]

{ #category : 'modifier state' }
Competitor >> moveXSquaresAhead: aNuumberOfSquares [

	myPosition := myPosition + aNuumberOfSquares
]

{ #category : 'initialization' }
Competitor >> setPosition: aSquare [

	myPosition := aSquare
]

{ #category : 'accessing - attributes' }
Competitor >> showYourPosition [

	^ myPosition
]
