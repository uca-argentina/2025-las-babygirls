"
Avanza la nave M ‘parsecs’ hacia adelante. 
El efecto asigna parsecs de una lista de valores cada vez que una nave 
arriba a ese casillero, siempre de mayor a menor. Una vez que se dan todas 
las opciones de la lista de valores, se resetean. 
Ahora el tablero tiene una longitud total medida en parsecs; cada casillero 
tiene distribuida la distancia total de forma equitativa. 
"
Class {
	#name : 'HyperJump',
	#superclass : 'Cell',
	#instVars : [
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
        aPlayer incrementLap.
        newIndex := newIndex - aBoard squares size ].


    newCell:=  aBoard squares at: newIndex.
    aBoard playersPosition at: aPlayer put: newCell.
    self fightIn: aBoard with: aPlayer in: newCell.

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
