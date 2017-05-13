assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

class Pawn extends Piece
  constructor: (game, currCase, type, theme) ->
    super game, currCase, type, theme


module.exports = Pawn
