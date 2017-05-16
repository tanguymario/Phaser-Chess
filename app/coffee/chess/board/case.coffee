assert = require '../../utils/assert.coffee'

debug       = require '../../utils/debug.coffee'
debugThemes = require '../../utils/debug-themes.coffee'

class Case
  constructor: (game, board, boardCoords, gameCoords, themes) ->
    assert board?, "Board missing"
    assert boardCoords?, "Board coords missing"

    @game = game
    @board = board
    @theme = themes.cases
    @boardCoords = boardCoords
    @gameCoords = gameCoords

    @possibility = @game.add.sprite @gameCoords.x, @gameCoords.y, @theme.possibility.key
    @possibility.anchor.setTo 0.5, 0.5
    @possibility.alpha = 0
    @possibility.visible = false
    @possibility.tween = null


  stopTween: (tween) ->
    if tween?
      tween.stop()


  showPossible: ->
    @stopTween @possibility.tween
    @possibility.alpha = 0
    @possibility.visible = true

    # Appearing
    @possibility.tween = @game.add.tween @possibility
    @possibility.tween.to( {alpha: 1 }, 500, Phaser.Easing.Linear.None, true )
    @possibility.tween.start()

    @possibility.tween.onComplete.add @afterShow, @


  afterShow: ->
    @possibility.tween = @game.add.tween @possibility
    @possibility.tween.to( { alpha: 0.5 }, 500, Phaser.Easing.Linear.None, true, 0, -1 )
    @possibility.tween.yoyo true, 0



  hidePossible: ->
    @stopTween @possibility.tween

    @possibility.tween = @game.add.tween @possibility
    @possibility.tween.to( {alpha: 0 }, 500, Phaser.Easing.Linear.None, true )
    @possibility.tween.start()

    # @possibility.visible = false



module.exports = Case
