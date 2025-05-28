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

	| typeCounts parsecList parsecIndex squares |
"	typeCounts := {
		              (Normal -> 4).
		              (BlackHole -> 2).
		              (HyperSpaceJump -> 2).
		              (MoonWalk -> 2).
		              (HyperJump -> 2).
		              (AtomicBomb -> 2) } asDictionary."

	parsecList := #( 20 15 10 5 ).
	parsecIndex := 1.
	
	typeCounts := {
    { Normal . 4 }.
    { BlackHole . 2 }.
    { HyperSpaceJump . 2 }.
    { MoonWalk . 2 }.
    { HyperJump . 2 }.
    { AtomicBomb . 2 }
}.


	squares := OrderedCollection new.

	"typeCounts keysAndValuesDo: [ :type :count |
		count timesRepeat: [ squares add: type new initialize ] ]."
	
	typeCounts do: [ :pair |
    | type count |
    type := pair first.
    count := pair second.
    count timesRepeat: [ squares add:
	(type = MoonWalk 
	ifTrue: [ type new initializeWith: -4  ]  
	ifFalse: [type new initialize ]
)].
].

	boardSize := squares size.
	boardSquares := squares.
	playersPosition := Dictionary new.

	players do: [ :player |
		playersPosition at: player put: boardSquares first ]
]
