assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Piece
  constructor: (game, currCase, type, theme) ->
    assert currCase?, "Current Case missing"
    assert type?, "Type missing"
    assert theme?, "Theme missing"

    @game = game
    @currCase = currCase
    @type = type
    @theme = theme

    pos = currCase.gameCoords
    pos.x += currCase.board.caseSize / 2
    pos.y += currCase.board.caseSize / 2
    @sprite = @game.add.sprite pos.x, pos.y, @theme.key, @type.spriteFrame
    @sprite.anchor.setTo 0.5, 0.5

    @scaleFactor = currCase.board.caseSize / @sprite.width
    @sprite.scale.setTo @scaleFactor

    @sprite.inputEnabled = true
    @sprite.input.enableDrag false

    @sprite.events.onInputDown.add @downHandler, @
    @sprite.events.onInputUp.add @upHandler, @


  downHandler: ->
    


  upHandler: ->



module.exports = Piece
