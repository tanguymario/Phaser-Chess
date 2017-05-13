Phaser = require 'Phaser'

config      = require '../config/config.coffee'

debug       = require '../utils/debug.coffee'
debugThemes = require '../utils/debug-themes.coffee'

Chess = require '../chess/chess.coffee'
ChessConfig = require '../chess/config/chess-config.coffee'

BoardConfig = require '../chess/board/board-config.coffee'
BoardTheme = require '../chess/board/board-theme.coffee'

PiecesTheme = require '../chess/pieces/pieces-theme.coffee'

PlayerHuman = require '../chess/player/player-human.coffee'
PlayerAi = require '../chess/player/player-ai.coffee'

class Game extends Phaser.State
  constructor: ->
    debug 'Constructor...', @, 'info', 30, debugThemes.Phaser
    super

    @chessConfig = ChessConfig.classic
    @boardTheme = BoardTheme.classic
    @boardConfig = BoardConfig.classic
    @piecesTheme = PiecesTheme.classic


  preload: ->
    debug 'Preload...', @, 'info', 30, debugThemes.Phaser
    @game.load.image @boardTheme.key, @boardTheme.src
    @game.load.spritesheet @piecesTheme.key, @piecesTheme.src, @piecesTheme.sprite.width, @piecesTheme.sprite.height


  create: ->
    debug 'Create...', @, 'info', 30, debugThemes.Phaser

    player1 = new PlayerHuman @game
    player2 = new PlayerAi @game

    @chess = new Chess @game, @chessConfig, @boardConfig, @boardTheme, @piecesTheme, player1, player2


  toggleFullscreen: ->
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen()


module.exports = Game
