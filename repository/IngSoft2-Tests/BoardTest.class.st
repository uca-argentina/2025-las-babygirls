Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardTest >> testDummy [ 
|aBoard aNumberOfSquares |
aNumberOfSquares := 10.
aBoard := Board new initializeWith: aNumberOfSquares.
self assert: aBoard getNumberOfSquares equals: aNumberOfSquares. 
]
