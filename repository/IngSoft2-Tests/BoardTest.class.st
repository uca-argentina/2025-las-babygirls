Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
BoardTest >> testBoardHasCorrectSize [
    | board numberOfPlayers numberOfSquares builder aDie |
	
	numberOfSquares := 50.
	numberOfPlayers := 3.
	aDie := MockedDie withSides: 6.
	
    builder := Builder with: numberOfSquares players: numberOfPlayers dice: aDie.
	board := builder buildNormalBoard.
    self assert: (board squares) size equals: 50
]

{ #category : 'tests' }
BoardTest >> testDistributionFor10000Squares [

	| board counts numberOfSquares expectedRanges builder aDie numberOfPlayers |
	numberOfSquares := 10000.
	numberOfPlayers := 1.
	aDie := MockedDie withSides: 6.

	builder := Builder with: numberOfSquares players: numberOfPlayers dice: aDie.
	board := builder buildNormalBoard.

	"Toma los valores reales de cada tipo"
	counts := Dictionary new.
	counts
		at: #Normal
		put: (board squares count: [ :s | s class = Normal ]).
	counts
		at: #BlackHole
		put: (board squares count: [ :s | s class = BlackHole ]).
	counts
		at: #HyperSpaceJump
		put: (board squares count: [ :s | s class = HyperSpaceJump ]).
	counts
		at: #MoonWalk
		put: (board squares count: [ :s | s class = MoonWalk ]).
	counts
		at: #HyperJump
		put: (board squares count: [ :s | s class = HyperJump ]).
	counts
		at: #AtomicBomb
		put: (board squares count: [ :s | s class = AtomicBomb ]).


	"Ahora pone un error del 10% para el valor esperado de cada tipo de celda"
	expectedRanges := Dictionary new.
	expectedRanges at: #Normal put: {
			(numberOfSquares * 0.40 * 0.90).
			(numberOfSquares * 0.40 * 1.10) }.
	expectedRanges at: #BlackHole put: {
			(numberOfSquares * 0.20 * 0.90).
			(numberOfSquares * 0.20 * 1.10) }.
	expectedRanges at: #HyperSpaceJump put: {
			(numberOfSquares * 0.20 * 0.90).
			(numberOfSquares * 0.20 * 1.10) }.
	expectedRanges at: #MoonWalk put: {
			(numberOfSquares * 0.10 * 0.90).
			(numberOfSquares * 0.10 * 1.10) }.
	expectedRanges at: #HyperJump put: {
			(numberOfSquares * 0.08 * 0.90).
			(numberOfSquares * 0.08 * 1.10) }.
	expectedRanges at: #AtomicBomb put: {
			(numberOfSquares * 0.02 * 0.90).
			(numberOfSquares * 0.02 * 1.10) }.

	expectedRanges keysAndValuesDo: [ :effect :range |
		| count message lower upper |
		count := counts at: effect.
		lower := range first.
		upper := range second.
		message := 'Count for ' , effect printString , ' was '
		           , count printString , ', expected between '
		           , lower printString , ' and ' , upper printString.
		self
			assert: (count between: lower asInteger and: upper asInteger)
			description: message ]
]

{ #category : 'tests' }
BoardTest >> testWhenTheSquaresAreLessThan10Fails [

	| aBoard aNumberOfSquares numberOfPlayers numberOfSquares builder aDie |
	
	numberOfSquares := 3.
	numberOfPlayers := 3.
	aNumberOfSquares := -1.
	aDie := MockedDie withSides: 6.
	
    builder := Builder with: numberOfSquares players: numberOfPlayers dice: aDie.
	 
	self
		should: [aBoard := builder buildNormalBoard ]
		raise: Error
		withMessageText: 'The board must have at least 10 squares.'
]
