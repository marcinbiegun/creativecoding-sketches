// space robacks
// background hsv(210,255,255)


palette $f
50 red
25 orange
25 yellow
end

color red
move -4,-4,-10

scale 0.5
DECAY: 0.05

//rotate map(wave(1000),0,1,80,110), 0,1,0


rotate 270, 0,1,0

for i: 0 to 10 step 1
  push
  z: map(wave(5000), 0,1, -30,0)
  noise_y: noise(i,1)
  noise_z: noise(i,2)
  spread: map(wave(2000), 0,1, 10,30)
  move 0,noise_y*(spread/4)+2,(noise_z*spread) + z

  noise_w1: noise(i, 5)
  noise_w2: noise(i, 6)
  noise_w3: noise(i, 7)

  w1: map(noise_w1, 0,1, 1000,4000)
  w2: map(noise_w2, 0,1, 50,300)
  w3: map(noise_w3, 0,1, 700,1500)

  move (wave(w1)*10),wave(w2) + ((wave(w3)*6) - 3)
  particle 0.5
    color hsv(map(HEALTH,1,0, 100,200), 255, map(HEALTH, 0,1, 0,200))
    ball HEALTH*0.5
  end
  pop
end



