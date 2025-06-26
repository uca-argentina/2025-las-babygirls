"
Sabe como repartir las cartas y sus efectos
"
Class {
	#name : 'Croupier',
	#superclass : 'Object',
	#instVars : [
		'cardsPlayed',
		'activeCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
Croupier class >> cardTypes [
  "Devuelve un Array con las seis clases de carta."
  ^ {
    Speed.
    Mercenary.
    Acceleration.
    Cancellation.
    Repeat.
    Redo.
  }.
]

{ #category : 'behavior' }
Croupier >> activateCard: aCard to: aPlayerOrCard [
	| newCard |
	newCard := self checkRedo: aCard.
	cardsPlayed add: aCard.
	((aPlayerOrCard isKindOf: Player) and: (aCard class superclass = PermanentCards class))
		ifTrue: [
			activeCards add: (aCard with: aPlayerOrCard)
		]
		ifFalse: [
			(aPlayerOrCard isKindOf: Player) ifFalse: [
				self removeCard: aPlayerOrCard
			]
		]
]

{ #category : 'behavior' }
Croupier >> activeCards [
	^activeCards.

]

{ #category : 'behavior' }
Croupier >> cardsPlayed [
	  ^cardsPlayed.
]

{ #category : 'behavior' }
Croupier >> changeTotalRollTo: aPlayer [
    | accelerationCount speedCount |
    accelerationCount := activeCards count: [:card | 
        card isKindOf: Acceleration].
    speedCount := activeCards count: [:card | 
        (card isKindOf: Speed) and:  card player == aPlayer ].
    ^ accelerationCount + speedCount 




]

{ #category : 'behavior' }
Croupier >> checkRedo: aCard [
    ^ (aCard isKindOf: Redo)
        ifTrue: [
            cardsPlayed isEmpty ifTrue: [ self error: 'There is no card to redo.' ].

            "REGLA CORRECTA: Busca hacia atrás la última carta jugada que NO sea de tipo Redo"
            cardsPlayed reversed detect: [ :eachCard | (eachCard isKindOf: Redo) not ] ifNone: [
                self error: 'Could not find a non-redo card to copy.'
            ]
        ]
        ifFalse: [ aCard ]
]

{ #category : 'behavior' }
Croupier >> drawCard [
  ^ {Acceleration . Repeat . Speed. Cancellation . Redo . Mercenary } atRandom new.

]

{ #category : 'behavior' }
Croupier >> giveInitialCardsTo: players [
    
    players do: [ :player |
        2 timesRepeat: [ player receiveCard: self drawCard ].
    ].

]

{ #category : 'initialization' }
Croupier >> initialize [ 
	super initialize.
	cardsPlayed := OrderedCollection new.
	activeCards := OrderedCollection new.
	
	
]

{ #category : 'behavior' }
Croupier >> removeCard: aCardIndex [
		
	(aCardIndex < 1) ifTrue: [
		self error: 'Card index must be positive.'
	].


	(aCardIndex > activeCards size) ifTrue: [
		self error: 'There is no card at that index.'
	].

	^ activeCards removeAt: aCardIndex

]
