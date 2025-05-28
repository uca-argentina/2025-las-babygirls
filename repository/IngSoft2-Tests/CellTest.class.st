Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoAtomicBombThenAllThePlayersLose1Shield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=13.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch player:1) shield equals: 2.
	self assert: (aMatch player:2) shield equals: 2.
	
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoAtomicBombThenAllThePlayersReturnToFirstCell [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=13.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 1.
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:2))) equals: 1.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoBlackHoleAndReturnsFourCells [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=5.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 2.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperSpaceJumpThenAdvance4Cells [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=6.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 11.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperSpaceJumpThenLoseOneShield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=6.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert:(aMatch player:1) shield equals: 2.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoMoonWalkCellThenOtherPlayerReturnNCells [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=9.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:2))) equals: 11.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoMoonWalkCellThenPlayerDoesntMove [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=9.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 10.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoNormalCellThenNothingsHappen [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides :=2.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.

	
	self assert: (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))) equals: 3.
	
 
]
