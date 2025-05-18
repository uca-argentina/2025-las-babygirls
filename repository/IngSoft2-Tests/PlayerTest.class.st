Class {
	#name : 'PlayerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
PlayerTest >> testDummy [

	| aCompetitor aNumber |
	aNumber := 7.
	aCompetitor := Player new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
PlayerTest >> testWhenAPlayerItsMovedToASpecificSquareItChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 7.
	aCompetitor := Player new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
PlayerTest >> testWhenPlayerAdvancesChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 3.
	aCompetitor := Player new.
	aCompetitor moveAhead: aNumber.

	self assert: aCompetitor showYourPosition equals: 3
]

{ #category : 'tests' }
PlayerTest >> testWhenPlayerCreatedItPositionIs0 [

	| aCompetitor |
	aCompetitor := Player new.

	self assert: aCompetitor showYourPosition equals: 0
]
