Class {
	#name : 'CompetitorTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CompetitorTest >> testDummy [

	| aCompetitor |
	aCompetitor := Competitor new.

	self assert: aCompetitor showYourPosition equals: 0
]

{ #category : 'tests' }
CompetitorTest >> testWhenCompetitorCreatedItPositionIs0 [

	| aCompetitor |
	aCompetitor := Competitor new.

	self assert: aCompetitor showYourPosition equals: 0
]
