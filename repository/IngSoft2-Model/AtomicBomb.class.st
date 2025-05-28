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
	    
		
		aBoard playersPosition keysDo: [ :player |
		player editShield: shields.
		aBoard sendToStart: player 
        ].

]

{ #category : 'initialization' }
AtomicBomb >> initialize [ 
	shields := -1.
	^self
]
