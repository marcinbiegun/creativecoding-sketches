color hsv(55, 200, 200)
stroke 11

push
  o: (TIME % 3000) / 3000
  i: map(o, 0, 1, 0, TWO_PI)
  move sin(i)*2,0,cos(i)*8
  cone 0.3, 0.5
pop
