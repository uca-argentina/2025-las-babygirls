"
Una casilla sin efecto.
"
Class {
	#name : 'Normal',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Normal >> applyEffectTo: aPlayer on: aBoard [
	

]

{ #category : 'behavior' }
Normal >> fightIn: aBoard with: aPlayer in: newCell [

	| ocupantes |
	ocupantes := aBoard playersPositions keys select: [ :jugador |
    (aBoard playersPositions at: jugador) = newCell
    and: [ jugador ~= aPlayer ] ].
    			
	(ocupantes isNotEmpty) 
    ifTrue: [ 
       aBoard battleBetween: aPlayer and: (ocupantes first).
			 		]
				

]
