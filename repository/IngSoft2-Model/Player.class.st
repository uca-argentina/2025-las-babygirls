"
Represents a player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'myPosition',
		'shields'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Player >> editShield: value [
	shields := shields = value
]

{ #category : 'initialization' }
Player >> initialize [
	shields := 3 .
]
