"
Represents a player
"
Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'shields',
		'turns'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Player >> editShield: value [
	shields := shields + value
]

{ #category : 'behavior' }
Player >> incrementTurn [

turns := turns +1.
]

{ #category : 'initialization' }
Player >> initialize [
	shields := 3 .
	turns := 0.
]

{ #category : 'accessing' }
Player >> shield [
	^shields.
]

{ #category : 'accessing' }
Player >> turns [
	^ turns
]
