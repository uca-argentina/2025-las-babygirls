Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BlackHoleTest >> testBlackHoleWithDifferentIntegerPortals [
    | blackHole p1 p2 |
    blackHole := BlackHole new.
    blackHole initialize: 5.

    p1 := blackHole getPortal1.
    p2 := blackHole getPortal2.

    self assert: (p1 isKindOf: SmallInteger).
    self assert: (p2 isKindOf: SmallInteger).
    self assert: p1 ~= p2.
]
