"
Where the game is played. 
Celdas ESPERADAS para un mocked board de 1000 celdas:
| Tipo de celda      | Cantidad | Rango de índices (1-based) |
| ------------------ | -------- | -------------------------- |
| **HyperJump**      | 80       | 1 – 80                     |
| **MoonWalk**       | 100      | 81 – 180                   |
| **Normal**         | 400      | 181 – 580                  |
| **HyperSpaceJump** | 200      | 581 – 780                  |
| **AtomicBomb**     | 20       | 781 – 800                  |
| **BlackHole**      | 200      | 801 – 1000                 |

"
Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'boardSquares',
		'turnsToWin',
		'playersPositions'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Board >> battleBetween: player1 and: player2 [
	| dado1 dado2 |
	dado1:= Die withSides: 6.
	dado2:= Die withSides: 6.
	(player1) battleWith: (player2) using:dado1 and: dado2 in: self.
	
	
]

{ #category : 'accessing - arguments' }
Board >> firstCell [

^boardSquares first.
]

{ #category : 'initialization' }
Board >> initializeWithSquares: aSquareCollection players: aPlayerDict size: aSize [
    boardSquares := aSquareCollection.
    playersPosition := aPlayerDict.
    boardSize := aSize.
	 turnsToWin := 3.
]

{ #category : 'accessing - arguments' }
Board >> numberOfSquares [

	^ numberOfSquares
]

{ #category : 'behavior' }
Board >> playTurnWith: aPlayer and: diceRoll [

	| currentIndex newIndex newCell ocupantes |
	aPlayer remainingSkippedTurns > 0 ifTrue: [
		aPlayer editShield: 3.
		aPlayer decrementTurnToLose.
		^ self ].
	currentIndex := boardSquares indexOf: (playersPositions at: aPlayer).
	newIndex := currentIndex + diceRoll.

	[ newIndex > boardSquares size ] whileTrue: [
		aPlayer incrementLap.
		newIndex := newIndex - boardSquares size ].

	newCell := boardSquares at: newIndex.

	ocupantes := playersPositions keys select: [ :jugador |
		             (playersPositions at: jugador) = newCell and: [
			             jugador ~= aPlayer ] ].

	playersPositions at: aPlayer put: newCell.


	(ocupantes isNotEmpty and: newCell class = Normal)
		ifTrue: [ self battleBetween: aPlayer and: ocupantes first ]
		ifFalse: [ newCell applyEffectFor: aPlayer with: self ]
]

{ #category : 'test methods' }
Board >> playersPositions [ 
	^ playersPositions .
]

{ #category : 'test methods' }
Board >> positionOfPlayer: aPlayer [
	| result | 
 	result := (self squares indexOf: ((self playersPositions) at: aPlayer)).
	^result 
]

{ #category : 'behavior' }
Board >> sendToStart: aPlayer [
	playersPositions at: aPlayer put: boardSquares first.
]

{ #category : 'test methods' }
Board >> squares [ 
	^ boardSquares .
]

{ #category : 'behavior' }
Board >> wins: turns [
    ^ (turns = turnsToWin )
        or: [ turns > turnsToWin ].
]
