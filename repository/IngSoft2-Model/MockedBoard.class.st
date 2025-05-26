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
MockedBoard >> initialize [
	| typeCounts parsecList parsecIndex squares |

	typeCounts := {
		Cell -> 4.
		BlackHole -> 2.
		HyperSpaceJump -> 2.
		MoonWalk -> 2.
		HyperJump -> 2.
		AtomicBomb -> 2.
	} asDictionary.

	parsecList := #(20 15 10 5).
	parsecIndex := 1.

	squares := OrderedCollection new.

	typeCounts keysAndValuesDo: [ :type :count |
		count timesRepeat: [
			squares add: (type new initialize)
		].
	].

	boardSize := squares size.
	boardSquares := squares.

]
