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
    Redo.
    Repeat.
  }.
]

{ #category : 'behavior' }
Croupier >> activateCard: aCard to: aPlayer [
    activeCards add: (aCard with: aPlayer).
	 cardsPlayed add: aCard.

]

{ #category : 'behavior' }
Croupier >> cardTypes [
  ^ #(
    SpeedCard
    MercenaryCard
    AccelerationCard
    CancellationCard
    RedoCard
    RepeatCard
  ).
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
Croupier >> dealCardTo: aPlayer [
  aPlayer receiveCard: self drawCard.

]

{ #category : 'behavior' }
Croupier >> drawCard [
  ^ (self class cardTypes atRandom) new.

]

{ #category : 'behavior' }
Croupier >> giveInitialCardsTo: players [
    
    players do: [ :player |
        2 timesRepeat: [ player receiveCard: self drawCard ].
    ].

]

{ #category : 'initialization' }
Croupier >> initialize [ 

	cardsPlayed := OrderedCollection new.
	activeCards := OrderedCollection new.
]
