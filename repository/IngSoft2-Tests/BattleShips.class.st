Class {
	#name : 'BattleShips',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BattleShips >> testBanana [

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
