Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
BoardTest >> testWhenTheSquaresAreLessThan10Fails [

	| aBoard aNumberOfSquares |
	aNumberOfSquares := -1.
	self
		should: [ aBoard := Board new initializeWith: aNumberOfSquares ]
		raise: Error
		withMessageText: 'The board must have at least 10 Squares.'
]
