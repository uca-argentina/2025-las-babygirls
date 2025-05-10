Class {
	#name : 'Cell',
	#superclass : 'Object',
	#instVars : [
		'ships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cell >> enters: aShip [
	ships add: aShip.
]

{ #category : 'testing' }
Cell >> initialize [ 
	ships := OrderedCollection new.
]

{ #category : 'testing' }
Cell >> isOcuppied [
	^ ships notEmpty.
]

{ #category : 'accessing' }
Cell >> leaves: aShip [ 
	ships remove: aShip.
]
