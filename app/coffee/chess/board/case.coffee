assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Case
  constructor: (game, board, boardCoords, gameCoords) ->
    assert board?, "Board missing"
    assert boardCoords?, "Board coords missing"

    @game = game
    @board = board
    @boardCoords = boardCoords
    @gameCoords = gameCoords


module.exports = Case
