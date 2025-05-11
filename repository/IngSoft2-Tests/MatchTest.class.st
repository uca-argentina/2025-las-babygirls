Class {
	#name : 'MatchTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MatchTest >> testDummy [

| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides |
aNumberOfPlayers := 2.
aNumberOfSquares := 10.
aNumberOfSides := 6.

aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.
aMatch addDie: aNumberOfSides.

self assert: (aMatch rollTheDice isNumber).
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfPlayersIsEqualToTheNumberGiven [

| aMatch aNumberOfSquares aNumberOfPlayers |
aNumberOfPlayers := 2.
aNumberOfSquares := 10.

aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

self assert: aMatch getNumberOfPlayers equals: aNumberOfPlayers.
]

{ #category : 'tests' }
MatchTest >> testTheNumberOfSquaresIsEqualToTheNumberGiven [

| aMatch aNumberOfSquares aNumberOfPlayers |
aNumberOfPlayers := 2.
aNumberOfSquares := 10.

aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.

self assert: aMatch getNumberOfSquares equals: aNumberOfSquares .
]

{ #category : 'tests' }
MatchTest >> testWhenDiceRolledGetsANumber [

| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides |
aNumberOfPlayers := 2.
aNumberOfSquares := 10.
aNumberOfSides := 6.

aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares.
aMatch addDie: aNumberOfSides.

self assert: (aMatch rollTheDice isNumber).
]
