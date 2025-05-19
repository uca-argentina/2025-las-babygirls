Class {
	#name : 'DieTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
DieTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
DieTest >> testDummy [

	| aDice errorMessage |
	errorMessage := 'The sides of the dice must be at least 2'.

	self
		should: [ aDice := Die withSides: -1 ]
		raise: Error
		withMessageText: 'The sides of the dice must be at least 2'.
]

{ #category : 'tests' }
DieTest >> testWhenADiceRollsTheValueIsCorrect [

	| aDie aNumber |
	aNumber := 6.
	aDie := MockedDie withSides: aNumber.
	self assert: (aDie roll) equals: 6.
]

{ #category : 'tests' }
DieTest >> testWhenDiceSidesNegativeThenFail [

	| aDie |

	self
		should: [ aDie := Die withSides: -1 ]
		raise: Error
		withMessageText: 'The sides of the dice must be at least 2'.
]
