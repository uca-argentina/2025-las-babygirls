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
CardTest >> testCancellationOnNonexistentPermanentRaisesError [
    | ctx player strayPerm cancel |
    ctx       := (Croupier new) initialize.
    player    := (Player   new) initialize.
    strayPerm := (Speed new owner: player).
    cancel    := (Cancellation new owner: player).
    self should: [ ctx activateCard: cancel to: strayPerm ] raise: Error.
]

{ #category : 'tests' }
CardTest >> testCancellationRemovesOnlyTheChosenPermanent [
    | ctx player perm1 perm2 cancel |
    
    ctx    := (Croupier new) initialize.
    player := (Player   new) initialize.

   
    perm1  := (Speed      new owner: player).
    perm2  := (Acceleration new owner: player).
    ctx activateCard: perm1 to: player.
    ctx activateCard: perm2 to: player.
    self assert: (ctx activeCards size = 2)
        description: 'Deben haber 2 permanentes antes de cancelar'.

    
    cancel := (Cancellation new owner: player).
    ctx activateCard: cancel to: perm1.

    self assert: ((ctx activeCards includes: perm1) not).

    self assert: (ctx activeCards includes: perm2).

    self assert: (ctx activeCards size) equals: 1.
]

{ #category : 'tests' }
CardTest >> testCannotPlayCancellationWhenNoPermanentsActive [
    | ctx player cancel |
    ctx    := (Croupier new) initialize.
    player := (Player   new) initialize.
    cancel := (Cancellation new owner: player).
    self should: [ ctx activateCard: cancel to: player ] raise: Error.
]

{ #category : 'tests' }
CardTest >> testNoResidueAfterInstantCards [
    | ctx p perm1 perm2 cancel repeat |
    ctx    := (Croupier new) initialize.
    p      := (Player new) initialize.
    perm1  := (Speed      new owner: p).
    perm2  := (Acceleration new owner: p).
    ctx activateCard: perm1 to: p.
    ctx activateCard: perm2 to: p.
    cancel := (Cancellation new owner: p).
    ctx activateCard: cancel to: perm1.
    repeat := (Repeat new owner: p).
    ctx activateCard: repeat to: perm2.
    self assert: (ctx activeCards size) equals: 0.
    self assert: (ctx cardsPlayed size) equals: 4.
]

{ #category : 'tests' }
CardTest >> testRepeatCanTargetDifferentPlayer [
    | ctx p1 p2 speed repeat |
    ctx := (Croupier new) initialize.
    p1  := (Player new) initialize.
    p2  := (Player new) initialize.
    speed := (Speed new owner: p1).
    ctx activateCard: speed to: p1.
    self assert: (p1 totalRollBonus) equals: 1.
    self assert: (p2 totalRollBonus) equals: 0.
    repeat := (Repeat new owner: p1).
    ctx activateCard: repeat to: p2.
    self assert: (p2 totalRollBonus) equals: 1.
]

{ #category : 'tests' }
CardTest >> testRepeatCannotWhenNoPreviousEffect [
    | ctx player repeat |
    ctx    := (Croupier new) initialize.
    player := (Player new) initialize.
    repeat := (Repeat new owner: player).
    self should: [ ctx activateCard: repeat to: player ] raise: Error.
]

{ #category : 'tests' }
CardTest >> testRepeatReappliesLastPermanentEffectOnSameTarget [
    | ctx player speed repeat |
    ctx    := (Croupier new) initialize.
    player := (Player new) initialize.
    speed  := (Speed new owner: player).
    ctx activateCard: speed to: player.
    self assert: (player totalRollBonus) equals: 1.
    repeat := (Repeat new owner: player).
    ctx activateCard: repeat to: player.
    self assert: (player totalRollBonus) equals: 2.
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
