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
	aCompetitor := Competitor new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
CompetitorTest >> testWhenACompetitorItsMovedToASpecificSquareItChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 7.
	aCompetitor := Competitor new.
	aCompetitor setPosition: aNumber.

	self assert: aCompetitor showYourPosition equals: 7
]

{ #category : 'tests' }
CompetitorTest >> testWhenCompetitorAdvancesChangesItsPosition [

	| aCompetitor aNumber |
	aNumber := 3.
	aCompetitor := Competitor new.
	aCompetitor moveXSquaresAhead: aNumber.

	self assert: aCompetitor showYourPosition equals: 3
]

{ #category : 'tests' }
CompetitorTest >> testWhenCompetitorCreatedItPositionIs0 [

	| aCompetitor |
	aCompetitor := Competitor new.

	self assert: aCompetitor showYourPosition equals: 0
]
