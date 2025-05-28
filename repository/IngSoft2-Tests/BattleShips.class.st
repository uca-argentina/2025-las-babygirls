Class {
	#name : 'BattleShips',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BattleShips >> testBanana [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie player2Position |
	aNumberOfPlayers := 2.
	aNumberOfSides :=2.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playTurnMocked: (aMatch player:1).
	aMatch playTurnMocked: (aMatch player:1).
	
	
	player2Position := (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:2))).
	
	self assert: (player2Position = 1).
	
]

{ #category : 'tests' }
BattleShips >> testWhen2ShipsAreInANormalCellThenBattleAndTheLoserLoseOneShield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie escudos1 escudos2 |
	aNumberOfPlayers := 2.
	aNumberOfSides :=2.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.
	escudos1 := (aMatch player: 1) shield.
	escudos2 := (aMatch player: 2) shield.
	
	self assert: (
		((escudos1 = 3) and: (escudos2 = 2)) or: ((escudos1 = 2) and: (escudos2 = 3)) 
	  ).
	
]

{ #category : 'tests' }
BattleShips >> testWhen2ShipsAreInANormalCellThenBattleAndTheLoserReturnToTheFirstCell [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie player1Position player2Position |
	aNumberOfPlayers := 2.
	aNumberOfSides :=2.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	aMatch := Match mockedWith: aNumberOfPlayers  and: dice.
	aMatch playRound.
	player1Position := (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:1))).
	player2Position := (aMatch board squares indexOf: (aMatch board playersPosition at: (aMatch player:2))).
	
	self assert: (
		((player1Position = 1) and: (player2Position = 3)) or: ((player1Position = 3) and: (player2Position = 1)) 
	  ).
	
]
