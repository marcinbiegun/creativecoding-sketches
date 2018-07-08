DECAY: 0.2


move 0,1,-10
rotate 90, 0,-1,0

rotate 0


pos: rand(10)

move 0,0,pos


move map((TIME%2000), 0, 2000, 0, 20),0,0
cone
