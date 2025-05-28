"
Una casilla sin efecto.
"
Class {
	#name : 'Cell',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Cell >> applyEffectFor: aPlayer with: aBoard [
	self subclassResponsibility.

]

{ #category : 'initialization' }
Cell >> initialize [
    self subclassResponsibility.
]
