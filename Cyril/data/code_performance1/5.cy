
DECAY: 0.05

rotate 270,0,1,0

rotate 90,0,0


move map(wave(5000), 0,1,-8,-2),0,0


for i:0 to 20 step 1
push
  noise_x: noise(i,1)
  noise_y: noise(i,2)
  noise_z: noise(i,2)

  w_x: noise_x * 2000
  w_y: noise_y * 5421
  w_z: noise_z * 4433

  move wave(1000), map(wave(w_y),0,1,-3,3), map(wave(w_x), 0,1,-5,5)

  particle 0.3
    color hsv(map(HEALTH,0,1,100,200),200,map(F2, 0,1,150,250))
    ball 0.3+(HEALTH*0.5)*map(F1, 0,1,0.2,2)
  end
pop
end


