"
Carta Permanente
● Incrementa en 1 la tirada total de todos las naves.
● Afecta la tirada total, no cada dado individual Carta Permanente
● Incrementa en 1 la tirada total de todos las naves.
● Afecta la tirada total, no cada dado individual
"
Class {
	#name : 'Cancellation',
	#superclass : 'InstantCards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
Cancellation >> applyEffectOn: aPermanentCard in: context [
    | removed |
    removed := context activeCards remove: aPermanentCard ifAbsent: [ nil ].
    removed ifNil: [ ^ self error: 'No hay carta permanente activa para cancelar' ].

]
