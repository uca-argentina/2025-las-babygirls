Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testCheckIfPlayerDoATurnDoesntWin [


	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=1400.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .

	self assert: aMatch winner equals: false
]

{ #category : 'tests' }
MatchTest >> testCheckIfWins [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=999400.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .

	self assert: aMatch winner equals: (aMatch player: 1)
]

{ #category : 'tests' }
MatchTest >> testPlayerTurn [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=399.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .


	self assert:( aMatch playerTurn: 1) equals: 0.


]

{ #category : 'tests' }
MatchTest >> testPodium [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares podiumArray |
	aNumberOfPlayers := 3.
	aNumberOfSides := 3400.
	aNumberOfSquares := 1000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound.

	podiumArray := aMatch podium.

	self assert: podiumArray size equals: 3.

	podiumArray do: [ :each | self assert: (each isKindOf: Player) ]
]

{ #category : 'tests' }
MatchTest >> testWhenNobodyHasWonItShowsNoWinner [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=399.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	self assert: aMatch winner equals: (false)
]
