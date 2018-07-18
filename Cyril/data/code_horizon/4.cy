// cones travel, jumping balls

// perspective
rotate 270, 0,1,0
move -40,0,0


// left
move 0,0.7,0

DECAY: 0.003

// move left-right
move 0,0.25,0



// cones forth
blink 5,50
particle 0.2, 0, -0.00005, map(wave(1000), 0,1, -0.002, 0.002)
  color red
  cone 1
end
end



// balls up
blink 5,10
move 0,0,map(wave(10), 0,1, -30,30)
particle 0.1, 0, -0.1, map(wave(1000), 0,1, -0.002, 0.002)
  color white
  sphereDetail 2
   stroke 2
   sphere rand(0.5,1)
end
end
