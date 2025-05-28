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

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |
	aNumberOfPlayers := 2.
	aNumberOfSides := 60.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection new.
	dice add: aDie.
	
	aMatch := Match mockedWith: aNumberOfPlayers and: dice.
	aMatch playRound.

	self assert: aMatch winner equals: (aMatch player: 1)
]

{ #category : 'tests' }
MatchTest >> testPlayerTurn [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie |

	aNumberOfPlayers := 7.
	aNumberOfSides := 60.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	aMatch := Match mockedWith: aNumberOfPlayers and: dice.
	aMatch playRound.


	self assert:( aMatch playerTurn: 1) equals: 4.


]

{ #category : 'tests' }
MatchTest >> testPodium [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie podiumArray |

	aNumberOfPlayers := 7.
	aNumberOfSides := 60.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	aMatch := Match mockedWith: aNumberOfPlayers and: dice.
	aMatch playRound.

	podiumArray := aMatch podium.

	self assert: podiumArray size equals: 3.

	podiumArray do: [ :each |
		self assert: (each isKindOf: Player)
	].

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
