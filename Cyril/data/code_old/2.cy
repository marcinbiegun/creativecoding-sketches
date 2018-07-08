stroke 1
rotate 90
move 1,0,0

push
i: (TIME % 1000) / 1000
move 0,0,i*10

color hsv(155, 200, 200)

scale 10
for y: 0 to 3 step 1
  move 0,0,y*-1
  grid
end
pop
