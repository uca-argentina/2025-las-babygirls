Class {
	#name : 'CellTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CellTest >> testIncrementIndexWrapsAfterFourSteps [
    | hj |
    hj := HyperJump new initialize.

    4 timesRepeat: [ hj incrementIndex ].
    self assert: (hj instVarAt: 2) equals: 1.
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoAtomicBombThenAllThePlayersLose1Shield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=689.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .

	self assert: (aMatch player:1) shield equals: 2.
	
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoAtomicBombThenAllThePlayersReturnToFirstCell [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides :=689.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound .

	
	self assert: (aMatch positionOfPlayer: 1) equals: 1.
	self assert: (aMatch positionOfPlayer: 2) equals: 1.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperJumpItPositionIncrements [
	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares firstPosition result |
	aNumberOfPlayers := 1.
	aNumberOfSides :=2.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	firstPosition := aMatch positionOfPlayer: 1.
	aMatch playTurn: (aMatch player:1).
	result := firstPosition < (aMatch positionOfPlayer: 1).
		
	self assert: result.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperSpaceJumpThenAdvance4Cells [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=549.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound.

	
	self assert: (aMatch positionOfPlayer: 1) equals: 554.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoHyperSpaceJumpThenLoseOneShield [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides := 549.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playRound.

	
	self assert:(aMatch player:1) shield equals: 2.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoMoonWalkCellThenOtherPlayerReturnNCells [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 2.
	aNumberOfSides :=109.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playTurn: (aMatch player: 1).

	
	self assert: ((aMatch positionOfPlayer: 2) between: 990 and:1000).
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoMoonWalkCellThenPlayerDoesntMove [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=109.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
		
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch positionOfPlayer: 1) equals: 110.
	
 
]

{ #category : 'tests' }
CellTest >> testPlayerFallsIntoNormalCellThenNothingsHappen [

	| aMatch aNumberOfPlayers aNumberOfSides dice aDie builder aNumberOfSquares |
	aNumberOfPlayers := 1.
	aNumberOfSides :=130.
	aNumberOfSquares := 1000.
	
	aDie := MockedDie withSides: aNumberOfSides.
	dice := OrderedCollection with: aDie.
	
	builder := Builder with: aNumberOfSquares players: aNumberOfPlayers dice: dice laps: 3.
	aMatch := builder createMockedMatch.
	aMatch playTurn: (aMatch player:1).

	
	self assert: (aMatch positionOfPlayer: 1) equals: 131.
	
 
]
