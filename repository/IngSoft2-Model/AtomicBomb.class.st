"
Vuelve a todos al primer casillero. 
La cantidad de vueltas que dio cada nave se mantiene. 
Resta 1 escudo a todas las naves 
"
Class {
	#name : 'AtomicBomb',
	#superclass : 'Normal',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
AtomicBomb >> applyEffectTo: aPlayer on: aBoard [
	    
		
		aBoard playersPositions keysDo: [ :player |
		player loseShield.
		aBoard sendToStart: player 
        ].

]
