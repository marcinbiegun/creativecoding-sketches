//rotate 0,-50,20
rotate
move 0,2,0

fill
scale 0.5

steps: 9

for x: 1 to steps step 1
  for y: 1 to steps step 1
    push
    h: (noise(wave(1000), x*y) * 15) - 3
    move 0,h/-2,0
    color hsv(255-(x*30),200,255-(20*y))
    box 1,h,1
    pop
    move 1,0,0
  end
  move (steps*-1)+1,0,1
end


