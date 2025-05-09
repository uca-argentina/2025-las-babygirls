Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> testDummy [

	| aDice aNumber |
	aNumber := 6.
	aDice := Dice new initializeWithSides: aNumber.
	self assert: (aDice roll > 0 and: aDice roll < (aNumber + 1)).
]

{ #category : 'tests' }
DiceTest >> testWhenADiceRollsTheValueIsCorrect [

	| aDice aNumber |
	aNumber := 6.
	aDice := Dice new initializeWithSides: aNumber.
	self assert: (aDice roll > 0 and: aDice roll < (aNumber + 1)).
]
