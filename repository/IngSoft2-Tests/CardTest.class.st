Class {
	#name : 'CardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardTest >> testWhenMatchStartsEveryPlayerHasTwoCards [
    | match players board dice |
    "Preparo dos jugadores"
    players := OrderedCollection with: (Player new) with: (Player new).

    "Creo tablero y dado"
    board := Board new.
    dice  := Die  new.

    "Inicializo la partida (reparte 2 cartas a cada jugador)"
    match := Match new
                initializeWithPlayers: players
                            board: board
                             dice: dice.

    "Verifico internamente que cada jugador tiene 2 cartas"
    players do: [ :player |
        | cardColl |
        cardColl := (player instVarNamed: 'cards').        "⟵ ojo con los paréntesis"
        self assert: (cardColl size) equals: 2.
    ].
]
