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

{ #category : 'accessing' }
Card >> applyEffectOn: target in: context [
    self subclassResponsibility.
]

{ #category : 'initialization' }
Card >> initializeWith: aPlayer [ 

player := aPlayer.
]

{ #category : 'accessing' }
Card >> owner [
	 ^owner.
]

{ #category : 'accessing' }
Card >> owner: aPlayer [
	owner:= aPlayer 
]

{ #category : 'accessing' }
Card >> player [
^player.
]
