Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testCheckIfPlayerDoATurnDoesntWin [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 20.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares and: dice.
	aMatch playRound.

	self assert: aMatch winner equals: false
]

{ #category : 'tests' }
MatchTest >> testCheckIfWins [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 30.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares and: dice.
	aMatch playRound.

	self assert: aMatch winner equals: (aMatch player: 1)
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
