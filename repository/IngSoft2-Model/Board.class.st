"
Where the game is played. 
Celdas ESPERADAS para un mocked board de 1000 celdas:
| Tipo de celda      | Cantidad | Rango de índices (1-based) |
| ------------------ | -------- | -------------------------- |
| **HyperJump**      | 800      | 1 – 800                    |
| **MoonWalk**       | 1000     | 801 – 1800                 |
| **Normal**         | 3000     | 1801 – 4800                |
| **HyperSpaceJump** | 2000     | 4801 – 6800                |
| **AtomicBomb**     | 200      | 6801 – 7000                |
| **CardSquare**     | 1000     | 70001 – 8000               |
| **BlackHole**      | 2000     | 8001 – 1000                |

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

{ #category : 'behavior race' }
Board >> applyLossConsequencesTo: aPlayer [
    aPlayer loseShield.
    self sendToStart: aPlayer.

	
	
]

{ #category : 'behavior race' }
Board >> battleBetween: playersCollection [
    | currentCombatants diceRolls winners die maxRoll |

    currentCombatants := playersCollection asOrderedCollection.
    die := Die withSides: 100.

    [ currentCombatants size > 1 ] whileTrue: [
        "Todos tiran los dados"
        diceRolls := Dictionary new.
        currentCombatants do: [:player |
            diceRolls at: player put: (die roll)
        ].

        "Determinar el valor más alto de tirada"
        maxRoll := diceRolls values inject: 0 into: [:max :each | max max: each ].

        "Filtrar ganadores (puede haber más de uno)"
        winners := diceRolls keys select: [:player |
            (diceRolls at: player) = maxRoll
        ].

        "Penalizar a los que no ganaron"
        (currentCombatants reject: [:player | winners includes: player]) do: [:loser |
            self applyLossConsequencesTo: loser.
        ].

        "Actualizar combatientes solo con los ganadores"
        currentCombatants := winners asOrderedCollection.
    ].

    ^ currentCombatants first

]

{ #category : 'accessing - arguments' }
Board >> firstCell [

^boardSquares first.
]

{ #category : 'initialization' }
Board >> initializeWithSquares: aSquareCollection players: aPlayerDict size: aSize lapsToWin: lapsToWin [
    boardSquares := aSquareCollection.
    playersPositions := aPlayerDict.
	 turnsToWin := lapsToWin.
]

{ #category : 'behavior race' }
Board >> move: aPlayer toRelativePosition: aNumberOfSteps [
    | currentIndex newIndex newCell |
    
    currentIndex := boardSquares indexOf: (playersPositions at: aPlayer).
    newIndex := currentIndex + aNumberOfSteps.

    [ newIndex > boardSquares size ] whileTrue: [
        aPlayer incrementLap.
        newIndex := newIndex - boardSquares size
    ].
[ newIndex < 1 ] whileTrue: [
    aPlayer decrementLap.
    newIndex := newIndex + boardSquares size
].


    newCell := boardSquares at: newIndex.
    playersPositions at: aPlayer put: newCell.

]

{ #category : 'accessing - arguments' }
Board >> numberOfSquares [

	^ numberOfSquares
]

{ #category : 'behavior race' }
Board >> playTurnWith: aPlayer and: diceRoll [

	| newCell playersInCell |
	aPlayer isSkippingTurn ifTrue: [
		aPlayer recoverShields.
		aPlayer decrementSkippedTurns.
		^ self ].

	self move: aPlayer toRelativePosition: diceRoll.

	newCell := playersPositions at: aPlayer.
	newCell applyEffectTo: aPlayer on: self.
	playersInCell := self playersInSameSquareAs: aPlayer.


	playersInCell size > 1 ifTrue: [
    self battleBetween: playersInCell
].

]

{ #category : 'behavior race' }
Board >> playersInSameSquareAs: aPlayer [
    ^ playersPositions keys select: [:otherPlayer |
        (playersPositions at: otherPlayer) = (playersPositions at: aPlayer)
    ].

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

{ #category : 'behavior race' }
Board >> sendToStart: aPlayer [
	playersPositions at: aPlayer put: boardSquares first.
]

{ #category : 'test methods' }
Board >> squares [ 
	^ boardSquares .
]

{ #category : 'behavior race' }
Board >> wins: turns [
    ^ (turns = turnsToWin )
        or: [ turns > turnsToWin ].
]
