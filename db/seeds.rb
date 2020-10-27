Player.create(
  name: "Tyler",
  password: "123",
  age: 36,
  favorite_game: "Catan",
  win_phrase: "IYAMA GULDN GAWD",
  lose_phrase: "damn...",
  motto: "yolo"
)

Player.create(
  name: "Fei",
  password: "123",
  age: 29,
  favorite_game: "The ones I win",
  win_phrase: "duh doy",
  lose_phrase: "um, what??",
  motto: "brows on fleek"
)

Player.create(
  name: "Dad",
  password: "123",
  age: 61,
  favorite_game: "Cribbage",
  win_phrase: "yeah baby",
  lose_phrase: "shoot",
  motto: "wwjd"
)

Player.create(
  name: "Mom",
  password: "123",
  age: 36,
  favorite_game: "Cribbage",
  win_phrase: "yay",
  lose_phrase: "aww",
  motto: "maga"
)

Match.create(
  name: "Settlers of Catan",
  winner: "Tyler",
  score: 17,
  players: "Tyler , Fei",
  player_id: 1
)
