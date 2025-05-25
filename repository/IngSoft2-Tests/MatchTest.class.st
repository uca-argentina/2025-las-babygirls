Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testWhenATurnIsPlayedThePositionofItsPLayersItsIncremented [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	
	aDie := MockedDie withSides: 2.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares and: dice.
	aMatch playRound.

	self assert: (aMatch getPlayerPosition: 1)  equals: 2.
]

{ #category : 'tests' }
MatchTest >> testWhenNobodyHasWonItShowsNoWinner [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	
	aDie := MockedDie withSides: 2.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares and: dice.
	aMatch playRound.

	self assert: aMatch winner equals: (false)
]

{ #category : 'tests' }
MatchTest >> testWhenPlayer1WinsItReturnPlayer1 [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	
	aDie := MockedDie withSides: 10.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares and: dice.
	aMatch playRound.

	self assert: aMatch winner equals: (aMatch getPlayer: 1)
]
