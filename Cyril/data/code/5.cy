


background hsv(210,255,255)




for i:0 to 10 step 1

  y: map(wave(map(noise(i,1),0,1,200,600)),0,1,-2,2)
  x: map(wave(map(noise(i,2),0,1,500,900)),0,1,-2,2)
  z: map(wave(map(noise(i,3),0,1,1500,3400)),0,1,-2,2)

  move x,y,z

  particle 0.1
    fill
    //color hsv(HEALTH*255,200*HEALTH,200*HEALTH)
    color white
    ball 0.1+0.2*HEALTH
  end
end


fxNW 0.2,map(wave(1233),0,1,0.1,0.3) , map(wave(2000),0,1,0.1,0.2)

