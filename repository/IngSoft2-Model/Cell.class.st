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
Cell >> applyEffect: aPlayer [
	^ 0 .
]

{ #category : 'initialization' }
Cell >> initialize [
    super initialize.
    ^ self.
]
