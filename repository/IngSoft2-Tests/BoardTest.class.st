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
    | board  players player |
	
	player := Player new.
	players := OrderedCollection new.
	players add: player.
	
    board := Board new initializeWith: 50 and: players.
    self assert: (board squares) size equals: 50
]

{ #category : 'tests' }
BoardTest >> testDistributionFor50Squares [
    | board counts  players player |
	
	player := Player new.
	players := OrderedCollection new.
	players add: player.
	
    board := Board new initializeWith: 50 and: players .
    counts := Dictionary new.
    counts at: #Cell put: (board squares count: [ :s | s class = Cell]).
    counts at: #BlackHole put: (board squares count: [ :s | s class = BlackHole]).
    counts at: #HyperSpaceJump put: (board squares count: [ :s | s class = HyperSpaceJump]).
    counts at: #MoonWalk put: (board squares count: [ :s | s class = MoonWalk]).
    counts at: #HyperJump put: (board squares count: [ :s | s class = HyperJump]).
    counts at: #AtomicBomb put: (board squares count: [ :s | s class = AtomicBomb]).

    self assert: (counts at: #Cell) equals: 20.
    self assert: (counts at: #BlackHole) equals: 10.
    self assert: (counts at: #HyperSpaceJump) equals: 10.
    self assert: (counts at: #MoonWalk) equals:  5.
    self assert: (counts at: #HyperJump) equals:  4.
    self assert: (counts at: #AtomicBomb) equals:  1.
]

{ #category : 'tests' }
BoardTest >> testRemainderGoesToNoEffectForNonDivisible [
    | board expectedNoEffect players player |
	
	player := Player new.
	players := OrderedCollection new.
	players add: player.
	
    board := Board new initializeWith: 53 and: players .
    expectedNoEffect := ((53 * 40) // 100)+ (53 - (((53*40)//100) + ((53*20)//100) + ((53*20)//100) + ((53*10)//100) + ((53*8)//100) + ((53*2)//100))).
    self assert: (board squares count: [ :s | s class = Cell ]) equals: expectedNoEffect.
]

{ #category : 'tests' }
BoardTest >> testWhenTheSquaresAreLessThan10Fails [

	| aBoard aNumberOfSquares players player |
	
	player := Player new.
	players := OrderedCollection new.
	players add: player.
	aNumberOfSquares := -1.
	self
		should: [ aBoard := Board new initializeWith: aNumberOfSquares and: players ]
		raise: Error
		withMessageText: 'The board must have at least 10 Squares.'
]
