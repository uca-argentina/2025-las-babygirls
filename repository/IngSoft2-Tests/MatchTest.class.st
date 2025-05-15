Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testDummy [

	| aMatch aNumberOfSquares aNumberOfPlayers  |
	aNumberOfPlayers := 1.
	aNumberOfSquares := 10.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	self assert: ((aMatch getPlayer:aNumberOfPlayers) class) equals: (Player)
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfPlayersIsEqualToTheNumberGiven [

	| aMatch aNumberOfSquares aNumberOfPlayers |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.

	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	self assert: aMatch getNumberOfPlayers equals: aNumberOfPlayers
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfSquaresIsEqualToTheNumberGiven [

	| aMatch aNumberOfSquares aNumberOfPlayers |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.

	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	self assert: aMatch getNumberOfSquares equals: aNumberOfSquares
]

{ #category : 'tests' }
MatchTest >> testThePlayerGetter [

	| aMatch aNumberOfSquares aNumberOfPlayers  |
	aNumberOfPlayers := 1.
	aNumberOfSquares := 10.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	self assert: ((aMatch getPlayer:aNumberOfPlayers) class) equals: (Player)
]

{ #category : 'tests' }
MatchTest >> testWhenATurnIsPlayedThePositionofItsPLayersItsIncremented [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides initialPosition finalPosition |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.
	aMatch addDie: aNumberOfSides.
	initialPosition := (aMatch getPlayer: 1) showYourPosition.
	aMatch playRound.
	finalPosition := (aMatch getPlayer: 1) showYourPosition.

	self assert: initialPosition < finalPosition
]

{ #category : 'tests' }
MatchTest >> testWhenDiceRolledGetsANumber [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.

	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.
	aMatch addDie: aNumberOfSides.

	self assert: aMatch rollTheDice isNumber
]

{ #category : 'tests' }
MatchTest >> testWhenNobodyHasWonItShowsNoWinner [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	aMatch addDie: aNumberOfSides .
	aMatch playRound.

	self assert: aMatch getWinner equals: ('There is not a winner yet.')
]

{ #category : 'tests' }
MatchTest >> testWhenPlayer1WinsItReturnPlayer1 [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

	1 to: 10 do: [ :i | aMatch addDie: aNumberOfSides ].
	"Se agregan 10 dados para que el jugador 1 gane si o si"
	aMatch playRound.

	self assert: aMatch getWinner equals: (aMatch getPlayer: 1)
]
