Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> testWhenMatchStartsEveryPlayerHasTwoCards [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares  |
	aNumberOfPlayers := 1.
	aNumberOfSides :=109.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
		
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice.
	aMatch := builder createMockedMatch.


    "Verifico internamente que cada jugador tiene 2 cartas"
    self assert: (aMatch playerCards: 1) size equals: 2.
]
