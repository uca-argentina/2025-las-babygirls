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
	aNumberOfSides := 2000.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.

	self should: [ aMatch player: 2 useCard: 1 ] raise: Error
]

{ #category : 'tests' }
CardTest >> testWhenAPlayerUsesSpeedOnlyAffectsHim [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides := 2000.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.
	(aMatch player: 1 ) receiveCard: Speed .
	aMatch player: 1 useCard: 3 toPlayer: 1.
	aMatch playRound.

	self assert:  (aMatch positionOfPlayer: 1)  equals: 2002. 
	self assert:  (aMatch positionOfPlayer: 2)  equals: 2001.
]

{ #category : 'tests' }
CardTest >> testWhenIsntPlayerTurnItCantPlayACard [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides := 2000.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.

	self should: [ aMatch player: 2 useCard: 1 ] raise: Error
]

{ #category : 'tests' }
CardTest >> testWhenMatchStartsEveryPlayerHasTwoCards [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides := 109.
	aNumberOfSquares := 1000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.

	self assert: (aMatch playerCards: 1) size equals: 2
]

{ #category : 'tests' }
CardTest >> testWhenPlayerDoesntHaveTheCardFails [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides := 2000.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.

	self should: [ aMatch player: 1 useCard: 0 ] raise: Error.
	self should: [ aMatch player: 1 useCard: -1 ] raise: Error.
	self should: [ aMatch player: 1 useCard: 3 ] raise: Error
]

{ #category : 'tests' }
CardTest >> testWhenPlayerLandOnCardSquareGrabsACard [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides := 7049.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound.

	self assert: (aMatch playerCards: 1) size equals: 3
]

{ #category : 'tests' }
CardTest >> testWhenPlayerUseAccelerateItMovesOneSquareMore [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides := 2000.
	aNumberOfSquares := 10000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice
		           laps: 3.
	aMatch := builder createMockedMatch.
	aMatch player: 1 useCard: 1 toPlayer: 1.
	aMatch playRound.

	self assert: (aMatch positionOfPlayer: 1) equals: 2002
]
