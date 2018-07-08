// Happy 5th birthday!
//
// #algofive
//


rotate

color white


sphereDetail 3

for i: 0 to 20 step 1
push
  rotate 10*wave(1000)
  scale  0.5 + 1.2*wave(10000)
  color white
  stroke 6
  box F1+1
  pop


  stroke 3
  color hsv(wave(10000)*255, 200, map(F1, 0,1,0,255))

  scale 2
  push
  tile 4,4,4
  sphere 0.5
  end
  pop
end
