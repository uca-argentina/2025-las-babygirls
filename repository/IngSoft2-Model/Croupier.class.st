"
Sabe como repartir las cartas y sus efectos
"
Class {
	#name : 'Croupier',
	#superclass : 'Object',
	#instVars : [
		'cardsPlayed',
		'activeCards',
		'lastEffect',
		'lastEffectTarget'
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

    aCard applyEffectOn: aPlayer in: self.

  
    cardsPlayed add: aCard.

    (aCard isKindOf: PermanentCards)
        ifTrue: [ activeCards add: aCard ].

    lastEffect := [:newTarget |
        aCard applyEffectOn: newTarget in: self
    ].

  
    lastEffectTarget := aPlayer.

]

{ #category : 'behavior' }
Croupier >> activateCards [
	^activeCards.

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
	super initialize.
	cardsPlayed := OrderedCollection new.
	activeCards := OrderedCollection new.
	
	
]

{ #category : 'behavior' }
Croupier >> lastEffect [	
	^lastEffect.
]

{ #category : 'behavior' }
Croupier >> lastEffectTarget [
 	^lastEffectTarget 
  
]
