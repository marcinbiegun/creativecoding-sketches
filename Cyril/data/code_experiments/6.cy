
DECAY: 0.05

rotate

sphereDetail 2

color hsv(wave(1000)*255, 200,200)
fill
ball

stroke 2
for i: 0 to 20 step 1
  rotate map(noise(i,wave(1000)), 0,1, 0,100),   wave(2000),0,wave(1000)
  color hsv(wave(100)*36,200,200)
  particle 0.4
    sphere map(HEALTH, 0,1,1,0)
  end
end


