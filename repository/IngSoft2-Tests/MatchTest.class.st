Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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
