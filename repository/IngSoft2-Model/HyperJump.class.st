Class {
	#name : 'HyperJump',
	#superclass : 'Cell',
	#instVars : [
		'distance',
		'parsecPerCell',
		'index',
		'parsecCollection'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'behavior' }
HyperJump >> applyEffectFor: aPlayer with: aBoard [
 
   | currentIndex newIndex newCell |
    currentIndex := aBoard squares indexOf: (aBoard playersPosition at: aPlayer).
    newIndex := currentIndex + (parsecPerCell *(parsecCollection at:index )).
    self incrementIndex.
        [ newIndex > aBoard squares size ] whileTrue: [
        aPlayer incrementTurn.
        newIndex := newIndex - aBoard squares size ].


    newCell:=  aBoard squares at: newIndex.
    aBoard playersPosition at: aPlayer put: newCell.
    super fightIn: aBoard with: aPlayer in: newCell.

]

{ #category : 'behavior' }
HyperJump >> incrementIndex [

    index := index +1.
    (index>4) ifTrue: [ index := 1 ]
]

{ #category : 'intialization' }
HyperJump >> initialize [ 

     parsecPerCell := 2.
     index:= 1.
    parsecCollection := OrderedCollection new.

    4 timesRepeat: [
        parsecCollection add: (1 + (15 atRandom))
    ].
    parsecCollection := parsecCollection sort: [:a :b | a > b].
]
