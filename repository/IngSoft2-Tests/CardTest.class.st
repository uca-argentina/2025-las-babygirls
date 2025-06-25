Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> test [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides :=7049.
	aNumberOfSquares := 10000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	
	self assert: (aMatch playerCards: 1) size equals: 3.
]

{ #category : 'tests' }
CardTest >> testWhenMatchStartsEveryPlayerHasTwoCards [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares  |
	aNumberOfPlayers := 1.
	aNumberOfSides :=109.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.

    self assert: (aMatch playerCards: 1) size equals: 2.
]

{ #category : 'tests' }
CardTest >> testWhenPlayerLandOnCardSquareGrabsACard [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides :=7049.
	aNumberOfSquares := 10000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	
	self assert: (aMatch playerCards: 1) size equals: 3.
]
