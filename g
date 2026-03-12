import {createWorld} from "./engine/world.js"
import {createPlayer,movePlayer} from "./engine/player.js"
import {initInput} from "./engine/input.js"
import {startWeather} from "./systems/weather.js"
import {initMultiplayer} from "./engine/multiplayer.js"

createWorld()

createPlayer()

initInput(movePlayer)

startWeather()

initMultiplayer()
