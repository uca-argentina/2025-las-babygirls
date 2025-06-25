"
Lugar donde pueden recoger cartas
"
Class {
	#name : 'CardSquare',
	#superclass : 'Normal',
	#instVars : [
		'croupier'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
CardSquare >> applyEffectTo: aPlayer on: aBoard [
    
	 | aCard |
	aCard := croupier drawCard.
	 aPlayer receiveCard: aCard.
]

{ #category : 'initialization' }
CardSquare >> initialize [ 
	 croupier := Croupier new.
]
