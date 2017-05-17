assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

CasePossibility = require './case-possibility.coffee'

class Case
  constructor: (game, board, boardCoords, gameCoords, themes) ->
    assert board?, "Board missing"
    assert boardCoords?, "Board coords missing"

    @game = game
    @board = board
    @theme = themes.cases
    @boardCoords = boardCoords
    @gameCoords = gameCoords

    @possibility = new CasePossibility @game, @, themes


  showPossible: ->
    @possibility.showPossible()


  hidePossible: ->
    @possibility.hidePossible()



module.exports = Case
