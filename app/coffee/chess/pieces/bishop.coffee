assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

class Bishop extends Piece
  constructor: (game, board, currCase, type, theme) ->
    super game, board, currCase, type, theme


module.exports = Bishop
