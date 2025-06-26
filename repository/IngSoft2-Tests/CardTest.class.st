Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
CardTest >> should: aBlock raise: anErrorClass withMessageText: aMessage [
    self
        should: aBlock
        raise: anErrorClass
        withExceptionDo: [ :e | self assert: e messageText equals: aMessage ].

]

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
CardTest >> testCancellationRemovesOnlyTheChosenPermanent [

	| croupier player perm1 perm2 cancel |
	croupier := Croupier new initialize.
	player := Player new initialize.


	perm1 := Speed.
	player receiveCard: perm1.
	perm2 := Acceleration.
	player receiveCard: perm2.
	croupier activateCard: Speed to: player.
	croupier activateCard: Acceleration to: player.
	self
		assert: croupier activeCards size = 2
		description: 'Deben haber 2 permanentes antes de cancelar'.


	cancel := player receiveCard: Cancellation.
	croupier activateCard: Cancellation to: 1.
	self deny: croupier activeCards first class equals: perm1.
	self assert: croupier activeCards first class equals: perm2.

	self assert: croupier activeCards size equals: 1
]

{ #category : 'tests' }
CardTest >> testCannotPlayCancellationWhenNoPermanentsActive [

	| ctx player |
	ctx := Croupier new initialize.
	player := Player new initialize.
	player receiveCard: Cancellation.
	self
		should: [ ctx activateCard: Cancellation to: 1 ]
		raise: Error
		withMessageText: 'There is no card at that index.'.
]

{ #category : 'tests' }
CardTest >> testNoResidueAfterInstantCards [
    | ctx p perm1 perm2 cancel repeat |
    ctx    := (Croupier new) initialize.
    p      := (Player new) initialize.

    perm1  := Speed.
	 p receiveCard: Speed.
    perm2  := Acceleration.
	 p receiveCard: Acceleration.
    ctx activateCard: perm1 to: p.
    ctx activateCard: perm2 to: p.

    cancel  := Cancellation.
	 p receiveCard: Cancellation.
    ctx activateCard: cancel to: 1.

    repeat  := Redo.
	 p receiveCard: Redo.
    ctx activateCard: Redo to: 1.

    self assert: (ctx activeCards size) equals: 0.
    self assert: (ctx cardsPlayed size) equals: 4.
]

{ #category : 'tests' }
CardTest >> testRedoCannotWhenNoPreviousCardPlayed [ [
    | ctx player |
    ctx    := (Croupier new) initialize.
    player := (Player new) initialize.
    player receiveCard: Redo.
    self should: [ ctx activateCard: Redo to: player ] raise: Error withMessageText: 'There is no card to redo.'.
]


]

{ #category : 'tests' }
CardTest >> testRepeatCardAppliesLastCellEffectToTargetPlayer [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares player1 player2 initialPosition |
	aNumberOfPlayers := 2.
	aNumberOfSides := 549. 
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	
	player1 := aMatch player: 1.
	player2 := aMatch player: 2.

	
	aMatch playTurn: player1.
	self assert: (aMatch positionOfPlayer: 1) equals: 554.
	
	
	initialPosition := aMatch positionOfPlayer: 2.
	player2 receiveCard: Repeat new. 
	aMatch player: 2 useCard: 3 toPlayer: 2. 
	
	
	self assert: (aMatch positionOfPlayer: 2) equals: (initialPosition + 4).
]

{ #category : 'tests' }
CardTest >> testRepeatCardHasNoEffectAtStartOfGame [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares player1 initialPosition |
	aNumberOfPlayers := 1.
	aNumberOfSides := 100.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	
	player1 := aMatch player: 1.
	initialPosition := aMatch positionOfPlayer: 1.
	
	"El jugador 1 intenta usar Repeat antes de que nadie haya jugado un turno"
	player1 receiveCard: Repeat new.
	self assert: (aMatch playerCards: 1) size equals: 3.
	
	"Usa la carta Repeat"
	aMatch player: 1 useCard: 3 toPlayer: 1.
	
	"La posición no debería cambiar, pero la carta sí se consume"
	self assert: (aMatch positionOfPlayer: 1) equals: initialPosition.
	self assert: (aMatch playerCards: 1) size equals: 2.
]

{ #category : 'tests' }
CardTest >> testRepeatCardHasNoEffectIfLastEffectWasNormalCell [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares player1 player2 initialPosition |
	aNumberOfPlayers := 2.
	aNumberOfSides := 130. "Para caer en una celda Normal"
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	
	player1 := aMatch player: 1.
	player2 := aMatch player: 2.

	"Jugador 1 juega y cae en una celda Normal (131)"
	aMatch playTurn: player1.
	self assert: (aMatch positionOfPlayer: 1) equals: 131.

	initialPosition := aMatch positionOfPlayer: 2.
	player2 receiveCard: Repeat new.
	aMatch player: 2 useCard: 3 toPlayer: 2.
	
	"La posición del jugador 2 no debería cambiar"
	self assert: (aMatch positionOfPlayer: 2) equals: initialPosition.
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
