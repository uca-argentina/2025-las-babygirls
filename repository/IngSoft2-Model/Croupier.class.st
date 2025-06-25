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
Croupier >> activateCard: aCard [
    activeCards add: aCard.
	 cardsPlayed add: aCard.

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
Croupier >> drawCard [
    | options |
    options := { Acceleration. }.
    ^ (options atRandom) new

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
