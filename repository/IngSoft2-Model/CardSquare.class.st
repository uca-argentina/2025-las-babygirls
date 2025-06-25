"
Lugar donde pueden recoger cartas
"
Class {
	#name : 'CardSquare',
	#superclass : 'Normal',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
CardSquare >> applyEffectTo: aPlayer on: aBoard [
    
	aPlayer grabCard: Card new.
]
