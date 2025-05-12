
Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testDummy [

	| aMatch aNumberOfSquares aNumberOfPlayers  aWormhole |
	aNumberOfPlayers := 1.
	aNumberOfSquares := 10.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	self assert: ((aMatch getPlayer:aNumberOfPlayers) class) equals: (Player)
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfPlayersIsEqualToTheNumberGiven [

	| aMatch aNumberOfSquares aNumberOfPlayers aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.

	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	self assert: aMatch getNumberOfPlayers equals: aNumberOfPlayers
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfSquaresIsEqualToTheNumberGiven [

	| aMatch aNumberOfSquares aNumberOfPlayers aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.

	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	self assert: aMatch getNumberOfSquares equals: aNumberOfSquares
]

{ #category : 'tests' }
MatchTest >> testThePlayerGetter [

	| aMatch aNumberOfSquares aNumberOfPlayers  aWormhole |
	aNumberOfPlayers := 1.
	aNumberOfSquares := 10.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	self assert: ((aMatch getPlayer:aNumberOfPlayers) class) equals: (Player)
]

{ #category : 'tests' }
MatchTest >> testWhenATurnIsPlayedThePositionofItsPLayersItsIncremented [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides initialPosition finalPosition aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.
	aMatch addDie: aNumberOfSides.
	initialPosition := (aMatch getPlayer: 1) showYourPosition.
	aMatch playRound.
	finalPosition := (aMatch getPlayer: 1) showYourPosition.

	self assert: initialPosition < finalPosition
]

{ #category : 'tests' }
MatchTest >> testWhenDiceRolledGetsANumber [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.

	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.
	aMatch addDie: aNumberOfSides.

	self assert: aMatch rollTheDice isNumber
]

{ #category : 'tests' }
MatchTest >> testWhenNobodyHasWonItShowsNoWinner [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	aMatch addDie: aNumberOfSides .
	aMatch playRound.

	self assert: aMatch getWinner equals: ('There is not a winner yet.')
]

{ #category : 'tests' }
MatchTest >> testWhenPlayer1WinsItReturnPlayer1 [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.

	1 to: 10 do: [ :i | aMatch addDie: aNumberOfSides ].
	"Se agregan 10 dados para que el jugador 1 gane si o si"
	aMatch playRound.

	self assert: aMatch getWinner equals: (aMatch getPlayer: 1)
]
