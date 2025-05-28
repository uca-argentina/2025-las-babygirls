Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoBlackHoleAndReturnsToStart [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=6.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 2.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperSpaceJump [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=7.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 11.
	
 
]
