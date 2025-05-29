"
A board where we can do our tests, knowing where the special cells are. List:
		Cell -> 4.
		BlackHole -> 2.
		HyperSpaceJump -> 2.
		MoonWalk -> 2.
		HyperJump -> 2.
		AtomicBomb -> 2.
"
Class {
	#name : 'MockedBoard',
	#superclass : 'Board',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
MockedBoard >> initializeWith: players [
    | typeCounts squares |

    "Definir los tipos de casillas y cuántas de cada una"
    typeCounts := {
        { Normal . 4 }.
        { BlackHole . 2 }.
        { HyperSpaceJump . 2 }.
        { MoonWalk . 2 }.
        { HyperJump . 2 }.
        { AtomicBomb . 2 }
    }.

    squares := OrderedCollection new.

    typeCounts do: [:pair |
        | type count |
        type := pair first.
        count := pair second.
        count timesRepeat: [
            squares add: (
                type = MoonWalk
                    ifTrue: [ type new initializeWith: 3 ]
                    ifFalse: [ type new initialize ]
            )
        ].
    ].

    "Asignar casillas al tablero"
    boardSize := squares size.
    boardSquares := squares.

    "Inicializar posiciones de los jugadores"
    playersPosition := Dictionary new.
    players do: [:player |
        playersPosition at: player put: boardSquares first
    ].

]
