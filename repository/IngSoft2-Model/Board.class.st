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
Board >> applyLossConsequencesTo: aPlayer [
    aPlayer loseShield.
    self sendToStart: aPlayer.

	
	
]

{ #category : 'behavior' }
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
Board >> initializeWithSquares: aSquareCollection players: aPlayerDict size: aSize [
    boardSquares := aSquareCollection.
    playersPositions := aPlayerDict.
	 turnsToWin := 3.
]

{ #category : 'behavior' }
Board >> move: aPlayer toRelativePosition: aNumberOfSteps [
    | currentIndex newIndex newCell |
    
    currentIndex := boardSquares indexOf: (playersPositions at: aPlayer).
    newIndex := currentIndex + aNumberOfSteps.

    [ newIndex > boardSquares size ] whileTrue: [
        aPlayer incrementLap.
        newIndex := newIndex - boardSquares size
    ].

    newCell := boardSquares at: newIndex.
    playersPositions at: aPlayer put: newCell.

]

{ #category : 'accessing - arguments' }
Board >> numberOfSquares [

	^ numberOfSquares
]

{ #category : 'behavior' }
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

{ #category : 'behavior' }
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
