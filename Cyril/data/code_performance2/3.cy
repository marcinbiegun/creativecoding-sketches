background hsv(210,255,255)


DECAY: 0.05

rotate 270,0,1,0


stroke 5
sphereDetail 2

color red

for i: 0 to 13 step 1
push
  x: noise(i,1)
  y: noise(i,2)
  z: noise(i,3)

  move map(wave(1000+(z*y)), 0,1,-2,2), map(wave(x*22220),0,1,-2,2) * wave(z*12333), map(wave(y*3323),0,1, -2,2)

  particle 0.3
    color green
    //color hsv(map(wave(2000+(x*y*z)/100),0,1, 0,255),HEALTH*255,255)

    sphere HEALTH*map(F1, 0,1, 0.3,1.5)
  end
pop
end
