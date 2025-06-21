Class {
	#name : 'BattleShips',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BattleShips >> testWhen2ShipsAreInANormalCellThenBattleAndTheLoserLoseOneShield [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares escudos1 escudos2 |
	aNumberOfPlayers := 2.
	aNumberOfSides :=399.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	
	escudos1 := (aMatch player: 1) shield.
	escudos2 := (aMatch player: 2) shield.
	
	self assert: (
		((escudos1 = 3) and: (escudos2 = 2)) or: ((escudos1 = 2) and: (escudos2 = 3)) 
	  ).
	
]

{ #category : 'tests' }
BattleShips >> testWhen2ShipsAreInANormalCellThenBattleAndTheLoserReturnToTheFirstCell [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares player1Position player2Position result |
	aNumberOfPlayers := 2.
	aNumberOfSides :=399.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	player1Position := aMatch positionOfPlayer: 1.
	player2Position := aMatch positionOfPlayer: 2.
	result := ((player1Position = 1) and: (player2Position = 400)) or: ((player1Position = 400) and: (player2Position = 1)).
	
	self assert: (result).
	
]

{ #category : 'tests' }
BattleShips >> testWhenAPlayerLoseAllShieldsItDoesntMove [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares playerShield playerTurnsToLose |
	aNumberOfPlayers := 1.
	aNumberOfSides := 789.
	aNumberOfSquares := 1000.

	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.

	builder := Builder
		           with: aNumberOfSquares
		           players: aNumberOfPlayers
		           dice: dice.
	aMatch := builder createMockedMatch.
	
	aMatch playRound.
	aMatch playRound.
	aMatch playRound.

	playerShield := (aMatch player: 1) shield.
	playerTurnsToLose := (aMatch player: 1) remainingSkippedTurns.

	self assert: (playerShield = 3 and: playerTurnsToLose = 2).

	aMatch playRound .
	playerShield := (aMatch player: 1) shield.
	playerTurnsToLose := (aMatch player: 1) remainingSkippedTurns.

	self assert: (playerShield = 3 and: playerTurnsToLose = 1)
]

{ #category : 'tests' }
BattleShips >> testWhenPlayerInBlackHoleIsSentToACellWithOtherPlayerThenTheyBattleAndAPlayerLoseOneShield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares escudos1 escudos2 |
	aNumberOfPlayers := 2.
	aNumberOfSides :=899.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice.
	aMatch := builder createMockedMatch.
	aMatch playRound .
	
	escudos1 := (aMatch player: 1) shield.
	escudos2 := (aMatch player: 2) shield.
	self assert: (
		((escudos1 = 3) and: (escudos2 = 2)) or: ((escudos1 = 2) and: (escudos2 = 3)) 
	  ).
	
]
