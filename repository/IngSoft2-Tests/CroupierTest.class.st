Class {
	#name : 'CroupierTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CroupierTest >> testCardTypesSize [

self assert: (Croupier cardTypes size) equals: 6
]

{ #category : 'tests' }
CroupierTest >> testDrawCardIsACard [
    | card |
    card := Croupier new drawCard.
    self assert: (card isKindOf: Card).
]
