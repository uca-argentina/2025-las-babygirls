Class {
	#name : 'WormholeTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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
