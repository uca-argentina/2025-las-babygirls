Class {
	#name : 'AtomicBomb',
	#superclass : 'Cell',
	#instVars : [
		'shields'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
AtomicBomb >> applyEffectFor: aPlayer with: aBoard [
	    | newCell |
		
		aBoard playersPosition keysDo: [ :player |
		player editShield: shields.
		newCell := aBoard squares at: 1.
       aBoard playersPosition at: player put: newCell
        ].

]

{ #category : 'initialization' }
AtomicBomb >> initialize [ 
	shields := -1.
	^self
]
