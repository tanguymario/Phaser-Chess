assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

Piece = require './piece.coffee'

class Queen extends Piece
  constructor: (game, currCase, type, theme) ->
    super game, currCase, type, theme


module.exports = Queen