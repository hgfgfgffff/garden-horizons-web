const express = require("express")
const http = require("http")
const { Server } = require("socket.io")

const app = express()
const server = http.createServer(app)
const io = new Server(server)

app.use(express.static("public"))

let players = {}

io.on("connection",(socket)=>{

players[socket.id] = {
x:0,
y:0,
z:0,
skin:"red"
}

socket.emit("currentPlayers",players)

socket.broadcast.emit("newPlayer",{
id:socket.id,
player:players[socket.id]
})

socket.on("move",(data)=>{
players[socket.id] = data
io.emit("updatePlayers",players)
})

socket.on("changeSkin",(skin)=>{
players[socket.id].skin = skin
})

socket.on("disconnect",()=>{
delete players[socket.id]
io.emit("updatePlayers",players)
})

})

server.listen(3000,()=>{
console.log("server running")
})
