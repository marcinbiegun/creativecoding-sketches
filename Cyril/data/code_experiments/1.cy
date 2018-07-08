light 0,0,1000
light black, white


light wave(100)*100,0,1000

scale 2


rotate 
stroke 1
color red
tile 10,10,1
  for i: 0 to 10 step 1
    push
      scale noise(i, wave(1000))*2
      rotate noise(10+i, wave(2000))*100, noise(100+i, wave(1233))*100, noise(100+i, wave(3331))*100
      sphereDetail 3
      sphere
    pop
  end
end


