Class {
	#name : 'Wormhole',
	#superclass : 'Object',
	#instVars : [
		'inicio',
		'final'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Wormhole class >> from: anInicio to: aFinal [ 
	^ self  new initializeFrom: anInicio to:aFinal.
]

{ #category : 'initialization' }
Wormhole >> final [ 
	^final
]

{ #category : 'initialization' }
Wormhole >> inicio [
	^inicio
]

{ #category : 'initialization' }
Wormhole >> initializeFrom: anInicio to: aFinal [ 
	inicio := anInicio.
	final := aFinal.
]
