// ground lines + filters

move 0,1,-10

color red
rotate 90
move 0,0,(TIME%300)/300

tile 1, 1, 30
  stroke 5
  color hsv(20, 250, map(HEALTH, 1,0, 255,0))
  line 0,-30,0,30
end

//fxNW 0.2,0.2,wave(1000)*1
//fxK 0.5 + wave(1000)*1.5
