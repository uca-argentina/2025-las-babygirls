
Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
BoardTest >> testBoardInitializingWhithVariableLenght [

	| aBoard aNumberOfSquares |
	aNumberOfSquares := 10.
	aBoard := Board new initializeWith: aNumberOfSquares.
	self assert: aBoard getNumberOfSquares equals: aNumberOfSquares
]

{ #category : 'tests' }
BoardTest >> testDummy [

	| aBoard aNumberOfSquares errorMessage |
	aNumberOfSquares := -1.
	errorMessage := 'The board must have at least 5 Squares.'.
	self
		should: [ aBoard := Board new initializeWith: aNumberOfSquares ]
		raise: Error
		withExceptionDo: [ :error |
		self assert: error messageText = errorMessage ]
]

{ #category : 'tests' }
BoardTest >> testWhenTheSquaresAreLessThan5Fails [

	| aBoard aNumberOfSquares |
	aNumberOfSquares := -1.
	self
		should: [ aBoard := Board new initializeWith: aNumberOfSquares ]
		raise: Error
		withMessageText: 'The board must have at least 5 Squares.'
]