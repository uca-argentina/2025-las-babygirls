<<<<<<< HEAD:repository/IngSoft2-Tests/PlayerTest.class.st

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
	aCompetitor moveXSquaresAhead: aNumber.

	self assert: aCompetitor showYourPosition equals: 3
]

{ #category : 'tests' }
PlayerTest >> testWhenPlayerCreatedItPositionIs0 [

	| aCompetitor |
	aCompetitor := Player new.

	self assert: aCompetitor showYourPosition equals: 0
]
=======
Class {
	#name : 'CompetitorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CompetitorTest >> testDummy [

	| aCompetitor aNumber |
	aNumber := 7.
	aCompetitor := Player new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
CompetitorTest >> testWhenACompetitorItsMovedToASpecificSquareItChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 7.
	aCompetitor := Player new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
CompetitorTest >> testWhenCompetitorAdvancesChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 3.
	aCompetitor := Player new.
	aCompetitor moveXSquaresAhead: aNumber.

	self assert: aCompetitor showYourPosition equals: 3
]

{ #category : 'tests' }
CompetitorTest >> testWhenCompetitorCreatedItPositionIs0 [

	| aCompetitor |
	aCompetitor := Player new.

	self assert: aCompetitor showYourPosition equals: 0
]
>>>>>>> parent of 6a5e605 (Feature/creation of match (#13)):repository/IngSoft2-Tests/CompetitorTest.class.st
