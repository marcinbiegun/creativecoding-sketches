move -5,0,0
r: map(wave(3000),0,1,20,50)
rotate r, 0,1,0
move 0,rand(-5,5),rand(-5,5)
DECAY: 0.005
particle 0.1
  box 0.05
end