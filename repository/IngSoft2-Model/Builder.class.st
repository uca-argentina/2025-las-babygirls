"
In charge of initializing the game
"
Class {
	#name : 'Builder',
	#superclass : 'Object',
	#instVars : [
		'numberOfSquares',
		'players',
		'random',
		'dice',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Builder class >> with: aNumberOfSquares players: aNumberOfPlayers dice: aDice  laps: numberOfLapsToWin [
    ^ self new
        initializeWith: aNumberOfSquares players: aNumberOfPlayers dice: aDice laps: numberOfLapsToWin

]

{ #category : 'behavior' }
Builder >> assignPlayersToFirstSquare: squares [
    | playerPositions |
    playerPositions := Dictionary new.
    players do: [:player |
        playerPositions at: player put: squares first
    ].
    ^ playerPositions

]

{ #category : 'behavior' }
Builder >> buildMockedBoard [
    | sortedSquares playerPositions board |

    numberOfSquares < 10 ifTrue: [
        Error signal: 'The board must have at least 10 squares.'
    ].

    sortedSquares := self generateOrderedSquares.
    playerPositions := self assignPlayersToFirstSquare: sortedSquares.

    board := Board new.
    board initializeWithSquares: sortedSquares players: playerPositions size: numberOfSquares lapsToWin: 3.
    ^ board

]

{ #category : 'behavior' }
Builder >> buildNormalBoard [
    | sortedSquares shuffledSquares playerPositions board |

    numberOfSquares < 10 ifTrue: [
        Error signal: 'The board must have at least 10 squares.'
    ].

    sortedSquares := self generateOrderedSquares.
    shuffledSquares := self shuffleSquares: sortedSquares.
    playerPositions := self assignPlayersToFirstSquare: shuffledSquares.

    board := Board new.
    board initializeWithSquares: shuffledSquares players: playerPositions size: numberOfSquares lapsToWin: laps.
    ^ board

]

{ #category : 'behavior' }
Builder >> createMockedMatch [

	| match |
	match := Match new.
	match
		initializeWithPlayers: players
		board: self buildMockedBoard
		dice: dice.
	^ match
]

{ #category : 'behavior' }
Builder >> createNormalMatch [

	| match |
	match := Match new.
	match
		initializeWithPlayers: players
		board: self buildNormalBoard
		dice: dice.
	^ match
]

{ #category : 'behavior' }
Builder >> effectFactoryFor: effectSymbol [
    ^ (Dictionary newFrom: {
        #Normal -> [ Normal new initialize ].
        #BlackHole -> [ BlackHole new initialize ].
        #HyperSpaceJump -> [ HyperSpaceJump new initialize ].
        #MoonWalk -> [ MoonWalk new initializeWith: (1 to: 10) atRandom ].
        #HyperJump -> [ HyperJump new initialize ].
        #AtomicBomb -> [ AtomicBomb new initialize ].
        #CardSquare -> [ CardSquare new initialize ].
    }) at: effectSymbol
      ifAbsent: [ self error: 'Unknown square type: ', effectSymbol printString ].

]

{ #category : 'behavior' }
Builder >> generateOrderedSquares [
    | effectProbabilities effectCounts remainingSquares sortedSquares |

    effectProbabilities := Dictionary newFrom: {
        #Normal -> 0.30.
        #BlackHole -> 0.20.
        #HyperSpaceJump -> 0.20.
        #MoonWalk -> 0.10.
        #HyperJump -> 0.08.
        #AtomicBomb -> 0.02.
        #CardSquare -> 0.10.
    }.

    effectCounts := Dictionary new.
    effectProbabilities keysAndValuesDo: [:key :prob |
        effectCounts at: key put: (numberOfSquares * prob) floor.
    ].

    remainingSquares := numberOfSquares - (effectCounts values sum).
    effectCounts at: #Normal put: (effectCounts at: #Normal) + remainingSquares.

    sortedSquares := OrderedCollection new: numberOfSquares.
    effectCounts keysDo: [:key |
        | count factory |
        count := effectCounts at: key.
        factory := self effectFactoryFor: key.
        count timesRepeat: [ sortedSquares add: factory value ].
    ].

    ^ sortedSquares

]

{ #category : 'initialization' }
Builder >> initializeWith: aNumberOfSquares players: aNumberOfPlayers dice: aDice laps: numberOfLapsToWin [
	
	 dice := aDice.
	 laps := numberOfLapsToWin.
    numberOfSquares := aNumberOfSquares.
    players := OrderedCollection new.
    1 to: aNumberOfPlayers do: [:i |
        players add: Player new initialize
    ].
]

{ #category : 'behavior' }
Builder >> shuffleSquares: sortedSquares [
    ^ sortedSquares asArray shuffle asOrderedCollection

]
