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

{ #category : 'accessing - attributes' }
Competitor >> showYourPosition [

	^ myPosition
]
