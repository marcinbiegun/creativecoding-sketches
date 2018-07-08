// death star surface

DECAY: 0.005

// set perspective
rotate 270, 0,1,0
move -10,1,0

blink 5,5
move 0,0,rand(-2,2)
particle 0.1
  color white
  box 0.1
end
end

blink 1,10
push
move 0,0,rand(-6,-1)
particle 0.1
  color red
  cone 0.3
end
pop

push
move 0,0, rand(1,6)
particle 0.1
  color red
  cone 0.3
end
pop
end
