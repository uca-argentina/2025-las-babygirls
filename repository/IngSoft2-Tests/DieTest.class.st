Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DieTest >> testWhenADiceRollsTheValueIsCorrect [

	| aDice aNumber |
	aNumber := 6.
	aDice := Die withSides: aNumber.
	self assert: (aDice roll > 0 and: aDice roll < (aNumber + 1)).
]

{ #category : 'tests' }
DieTest >> testWhenDiceSidesNegativeThenFail [

	| aDice errorMessage |
	errorMessage := 'The sides of the dice must be at least 2'.

	self
		should: [ aDice := Die withSides: -1 ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText = errorMessage ]
]
