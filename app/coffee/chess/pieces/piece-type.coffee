King = require './king.coffee'
Bishop = require './bishop.coffee'
Knight = require './knight.coffee'
Pawn = require './pawn.coffee'
Queen = require './queen.coffee'
Rook = require './rook.coffee'
Team = require './team.coffee'

module.exports =
  W: # Whites
    King:
      spriteFrame: 6
      team: Team.White
      instance: King
    Queen:
      spriteFrame: 7
      team: Team.White
      instance: Queen
    Rook:
      spriteFrame: 8
      team: Team.White
      instance: Rook
    Bishop:
      spriteFrame: 9
      team: Team.White
      instance: Bishop
    Knight:
      spriteFrame: 10
      team: Team.White
      instance: Knight
    Pawn:
      spriteFrame: 11
      team: Team.White
      instance: Pawn
  B: # Blacks
    King:
      spriteFrame: 0
      team: Team.Black
      instance: King
    Queen:
      spriteFrame: 1
      team: Team.Black
      instance: Queen
    Rook:
      spriteFrame: 2
      team: Team.Black
      instance: Rook
    Bishop:
      spriteFrame: 3
      team: Team.Black
      instance: Bishop
    Knight:
      spriteFrame: 4
      team: Team.Black
      instance: Knight
    Pawn:
      spriteFrame: 5
      team: Team.Black
      instance: Pawn
