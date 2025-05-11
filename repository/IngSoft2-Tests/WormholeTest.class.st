Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
WormholeTest >> testWhenPlayerIsInWormholeEndThenWhenPlayturnsPlayerGoToWormholeStart [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides initialPosition finalPosition aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.
	aMatch addDie: aNumberOfSides.
	initialPosition := (aMatch getPlayer: 1) setPosition: 6.
	aMatch playRound.
	finalPosition := (aMatch getPlayer: 1) showYourPosition.

	self assert: finalPosition equals: aWormhole inicio.
]

{ #category : 'tests' }
WormholeTest >> testWhenPlayerIsInWormholeStartThenWhenPlayturnsPlayerGoToWormholeEnd [

	| aMatch aNumberOfSquares aNumberOfPlayers aNumberOfSides initialPosition finalPosition aWormhole |
	aNumberOfPlayers := 2.
	aNumberOfSquares := 10.
	aNumberOfSides := 6.
	aWormhole:= Wormhole from: 3 to: 6.
	aMatch := Match with: aNumberOfPlayers and: aNumberOfSquares andWormhole: aWormhole.
	aMatch addDie: aNumberOfSides.
	initialPosition := (aMatch getPlayer: 1) setPosition: 3.
	aMatch playRound.
	finalPosition := (aMatch getPlayer: 1) showYourPosition.

	self assert: finalPosition equals: aWormhole final.
]

{ #category : 'tests' }
WormholeTest >> testWhenWormHoleIsBiggerThanTheSquareInTheBoard [

	

	self
		should: [Match with: 4 and: 5 andWormhole: (Wormhole from: 3 to: 6).]
		raise: Error
		withMessageText: 'The wormhole have to be inside of the board size'.
]
