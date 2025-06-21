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

{ #category : 'behavior' }
Cell >> fightIn: aBoard with: aPlayer in: newCell [

	| ocupantes |
	ocupantes := aBoard playersPositions keys select: [ :jugador |
    (aBoard playersPositions at: jugador) = newCell
    and: [ jugador ~= aPlayer ] ].
    			
	(ocupantes isNotEmpty) 
    ifTrue: [ 
       aBoard battleBetween: aPlayer and: (ocupantes first).
			 		]
				

]
