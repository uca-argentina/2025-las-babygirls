Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> testDummy [

	| aDice errorMessage |
	errorMessage := 'The sides of the dice must be at least 2'.

	self
		should: [ aDice := Dice new initializeWithSides: -1 ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText = errorMessage ]
]

{ #category : 'tests' }
DiceTest >> testWhenADiceRollsTheValueIsCorrect [

	| aDice aNumber |
	aNumber := 6.
	aDice := Dice new initializeWithSides: aNumber.
	self assert: (aDice roll > 0 and: aDice roll < (aNumber + 1)).
]

{ #category : 'tests' }
DiceTest >> testWhenDiceSidesNegativeThenFail [

	| aDice errorMessage |
	errorMessage := 'The sides of the dice must be at least 2'.

	self
		should: [ aDice := Dice new initializeWithSides: -1 ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText = errorMessage ]
]
