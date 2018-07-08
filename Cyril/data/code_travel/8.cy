// clouds

// perspective
rotate 270, 0,1,0
move -50,0,0


move 0,-3,0

color white


// move emitor lef-tright
move 0,0,rand(-20,20)

DECAY: 0.002
color white

z: 1100

scale rand(1,2)

blink 2,100
particle 0.2
  sphereDetail 5
  // cloud
  for i: 0 to 18 step 1
    move 0,0,0.2
    push
      move map(noise(i*2,wave(1599)),0,1,-1,1), map(noise(i*8, wave(8051)),0,1,-1,1),map(noise(i*9, wave(15333)),0,1,-1,1)
      color white
      sphere map(noise(wave(1000)*10, 10), 0,1, 0.1,2)
    pop
  end
end
end
