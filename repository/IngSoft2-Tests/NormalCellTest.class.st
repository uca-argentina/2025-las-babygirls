Class {
	#name : 'NormalCellTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
NormalCellTest >> testIfCellHas2ShipsAndRemoveShipFromCellThenShouldBeOccupied [

	| aCell aShip aShip2 |
	aShip:='player-1'.
	aShip2:='player-2'.
	aCell := NormalCell new.
	aCell enters: aShip.
	aCell enters: aShip2.
	aCell leaves: aShip.
	self assert: aCell isOcuppied.
]

{ #category : 'tests' }
NormalCellTest >> testIfCellHasAShipThenIsOcuppied [

	| aCell aShip |
	aShip:='player-1'.
	aCell := NormalCell new.
	aCell enters: aShip.
	self assert: aCell isOcuppied.
]

{ #category : 'tests' }
NormalCellTest >> testIfCellHasNoShipThenShouldNotBeOccupied [

	| aCell |
	aCell := NormalCell new.
	self deny: aCell isOcuppied.
]
