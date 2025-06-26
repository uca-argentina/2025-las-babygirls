"
A card given to a player, it can be permanent or instantaneus.
"
Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'player',
		'owner'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Card class >> with: aPlayer [ 

^self new initializeWith: aPlayer.
]

{ #category : 'initialization' }
Card >> initializeWith: aPlayer [ 

player := aPlayer.
]

{ #category : 'accessing' }
Card >> player [
^player.
]
