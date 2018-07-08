move 0,0,-30
color blue



sphereDetail map(wave(3000),0,1, 2,12)
stroke 2


for i:0 to 5 step 1
  push
  rotate i*10
  scale map(wave(5000),0,1, 1,5)
  color hsv(noise(i,20)*wave(10000)*255,200,200)
  sphere map(F1,0,1, 5,10)
  color white
  stroke map(F1,0,1,2,10)
  box map(F1,0,1,2,3)*i
  pop
end
