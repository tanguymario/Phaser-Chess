P = require '../pieces/piece-type.coffee'

module.exports =
  classic: [
    [P.B.Rook, P.B.Knight, P.B.Bishop, P.B.Queen, P.B.King, P.B.Bishop, P.B.Knight, P.B.Rook]
    [P.B.Pawn, P.B.Pawn  , P.B.Pawn  , P.B.Pawn , P.B.Pawn, P.B.Pawn  , P.B.Pawn  , P.B.Pawn]
    [null    , null      , null      , null     , null    , null      , null      , null    ]
    [null    , null      , null      , null     , null    , null      , null      , null    ]
    [null    , null      , null      , null     , null    , null      , null      , null    ]
    [null    , null      , null      , null     , null    , null      , null      , null    ]
    [P.W.Pawn, P.W.Pawn  , P.W.Pawn  , P.W.Pawn , P.W.Pawn, P.W.Pawn  , P.W.Pawn  , P.W.Pawn]
    [P.W.Rook, P.W.Knight, P.W.Bishop, P.W.Queen, P.W.King, P.W.Bishop, P.W.Knight, P.W.Rook]
  ]
